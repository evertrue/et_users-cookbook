et_users cookbook CHANGELOG
============================
This file is used to list changes made in each version of the et_users cookbook.

v1.4.0 (2014-03-27)
------------------

* Use Berkshelf 3
* Add Test Kitchen config
* Stub out beginnings of what's needed for testing (ChefSpec & ServerSpec)
* Ensure `~/.vim/*` folders are created to play nicely w/ .vimrc installed by et_base cookbook
* Rubocop & Foodcritic cleanup

v1.3.0 (2014-02-12)
------------------

* Remove `rbenv` stuff
* Add `~/.extras.d` sourcing for flexible dotfiles mgmt outside of Chef

v1.2.0 (2014-02-12)
------------------

* Add `rbenv` EnvVar & init, wrapped in check for rbenv
* Update Gemfile to enforce proper Berkshelf usage

v1.1.1 (2013-11-15)
------------------

* Introduce CHANGELOG
* alias 'ls' so color is always used.
* Add time and return status to prompt
* Propagate custom profiles to root
