# VVV WooCommerce
This will create a development site for developing and testing WooCommerce with Storefront. This is to be used with [Varying Vagrants Vagrant](https://github.com/Varying-Vagrant-Vagrants/VVV).

## Getting Started

1. Follow every step in [The First Vagrant Up](https://github.com/Varying-Vagrant-Vagrants/VVV#the-first-vagrant-up) on the VVV repository.
2. Within the Vagrant directory you've created, you will find a `www` directory. Clone this branch of this repo into the `www` directory. If you have trouble, download the master branch and extract it into the `www` directory.
3. If you have Vagrant running, run `vagrant halt`.
4. Next run `vagrant up --provision`. This may take awhile.

Once the provisioning is completed, you can visit the following URL:

* http://woocommerce.dev