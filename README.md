# OVH webhosting bashrc

OVH webhosting offers SSH access to your account starting with "pro" plans. This
bashrc example add informations regarding your current ``.ovhconfig``
configuration and switches the PHP cli version as configured in your ``.ovhconfig``.

## How to use it

To install this ``.bashrc``, open an SSH connexion to your webhosting account
either using [Putty](https://docs.ovh.com/fr/fr/web/hosting/utilisation-putty-windows/)
if you are using Windows, or simply using ``ssh youraccount@yoursite.com`` on all other
platforms.

Then get the latest version from github and profit:

```shell
wget https://raw.githubusercontent.com/ovh/webhosting-ssh-bashrc/master/.bashrc -O $HOME/.bashrc
source $HOME/.bashrc
```

## Links

- *Web Hosting home*: https://www.ovh.com/fr/hebergement-web/
- *``.ovhconfig`` documentation*: ``https://docs.ovh.com/fr/fr/web/hosting/configurer-le-php-sur-son-hebergement-web-mutu-2014/``
- *Configure SSH access for your account*: https://docs.ovh.com/fr/fr/web/hosting/mutualise-le-ssh-sur-les-hebergements-mutualises/

## License

3-clause BSD

