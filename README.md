# A Puppet module for nginx whit the following function
* Forward Proxy
* Reverse Proxy

This puppet module allows to configure nginx to act as a reverse proxy for the HTTPS protocol and a forward proxy for the HTTP protocol.
For the configuration of the two types of proxy I chosen to develop two separate modules, both of which use a template to insert a configuration file in **/etc/nginx/conf.d**.
The nginx_app role takes care of installing and enabling the nginx package from the distribution's official repo, the default configuration file /etc/nginx/sites-enabled/default is also disabled (if you decide to use a different distribution you will need to disable the corresponding file), and then the role include the profile that include the modules forward and reverse.

I have chosen to use this structure to allow future module development in order to parameterize the configurations and make the module more easily reusable.

## What You Get From This Repo
Here's a visual representation of the structure of this repository:

```
│   .gitignore
│   environment.conf
│   README.md
│   Vagrantfile
│
├───manifests
│       site.pp
│
└───site-modules
    ├───forward
    │   ├───manifests
    │   │       init.pp
    │   │
    │   └───templates
    │           forward_proxy.conf.epp
    │
    ├───profile
    │   └───manifests
    │           forward_proxy.pp
    │           reverse_proxy.pp
    │
    ├───reverse
    │   ├───manifests
    │   │       init.pp
    │   │
    │   └───templates
    │           reverse_proxy.conf.epp
    │
    └───role
        └───manifests
                proxy_app.pp
```

## VAGRANT
To test the puppet plugin you can use the vagrant file:
```bash
    vagrant plugin install vagrant-puppet-install
    vagrant up
```
