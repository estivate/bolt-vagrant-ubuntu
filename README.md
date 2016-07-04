Vagrant Provisions
=====

Old school bash provisioning scripts, comment in/out the ones you need to
quickly spin up various dev environments using Vagrant.

```sh
git clone https://github.com/estivate/vagrant-provisions.git
cd vagrant-provisions
vagrant up
[much ado...]
vagrant ssh
```

The "provision/initial-setup.sh" script installs git and wget and is
pretty much required. The rest of the setup is broken across various files
listed below that can be commented in/out as needed at the bottom of the
 "Vagrantfile":

* add-bolt.sh (rabbitmq, bolt)
* add-golang.sh (installs go & sets up ~/work workspace)
* add-postgresql.sh (postgresql)
* add-ruby.sh (rbenv, ruby, sinatra, rails, node)
* add-sqlite3.sh (sqlite3)
* add-vim.sh (vim and my .vimrc file)

### Bolt Notes

* Using Ubuntu 16.04 for systemd used by bolt
* uses the 1.1.0 Bolt binary
* uses the default config.json that comes with bolt
* for dev purposes only
