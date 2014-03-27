## 1.4.0 (2014-03-27)

* Use Berkshelf 3
* Add Test Kitchen config
* Stub out beginnings of what's needed for testing (ChefSpec & ServerSpec)
* Ensure `~/.vim/*` folders are created to play nicely w/ .vimrc installed by et_base cookbook
* Rubocop & Foodcritic cleanup

## 1.3.0

* Remove `rbenv` stuff
* Add `~/.extras.d` sourcing for flexible dotfiles mgmt outside of Chef

## 1.2.0

* Add `rbenv` EnvVar & init, wrapped in check for rbenv
* Update Gemfile to enforce proper Berkshelf usage

## 1.1.1

* Introduce CHANGELOG
* alias 'ls' so color is always used.
* Add time and return status to prompt
* Propagate custom profiles to root
