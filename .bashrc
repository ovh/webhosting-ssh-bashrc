# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

function ovhConfig {
    local p=`pwd`
    local oc="unknown"

    local engine="cgi"
    local version="5.2"
    local env="prod"
    local image="legacy"

    if [[ "${p:0:7}" == "/homez." ]] && [[ $(dirname $p) != "/" ]]
    then
        while true
        do
            if [ -e "${p}/.ovhconfig" ]
            then
                oc="${p}/.ovhconfig"
                break
            fi

            if [[ $(dirname $p) == "/" ]]
            then
                oc="none"
                break
            fi

            p=`dirname ${p}`
        done
    fi

    if [ "${oc}" == "unknown" ]
    then
        return
    fi

    if [ ${oc} != "none" ]
    then
        engine=$(grep 'app.engine=' ${oc} | cut -d '=' -f2 | sed -e 's/[[:space:]]*$//')
        version=$(grep 'app.engine.version=' ${oc} | cut -d '=' -f2 | sed -e 's/[[:space:]]*$//')
        env=$(grep 'environment=' ${oc} | cut -d '=' -f2 | cut -b -4 | sed -e 's/[[:space:]]*$//')
        image=$(grep 'container.image=' ${oc} | cut -d '=' -f2 | sed -e 's/[[:space:]]*$//')

        if [ "${engine}" == "" ]; then engine='cgi'; fi
        if [ "${engine}" == "php" ]; then engine='fpm'; fi
        if [ "${version}" == "" ]; then version='5.2'; fi
        if [ "${env}" == "" ]; then env='prod'; fi
        if [ "${env}" == "deve" ]; then env='dev'; fi
        if [ "${image}" == "" ]; then image='legacy'; fi

    fi

    # Build prompt
    prompt="(${engine}/${version}/${env}/${image})"

    # Build path
    if echo "$PATH" | grep -q "/usr/local/php[0-9].[0-9]/bin"
    then
        PATH=$(echo "$PATH" | sed "s#/usr/local/php[0-9].[0-9]/bin#/usr/local/php${version}/bin#")
    else
        PATH="/usr/local/php$version/bin:$PATH"
    fi
    export PATH
}

set_bash_prompt(){
    ovhConfig
    PS1='\[\033[01;32m\]\u\[\033[00m\]@\[\033[01;31m\]\H\[\033[01;34m\] ${prompt} \w \$\[\033[00m\] '
}
PROMPT_COMMAND=set_bash_prompt

