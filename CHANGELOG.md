et_users cookbook CHANGELOG
============================
This file is used to list changes made in each version of the et_users cookbook.

v1.4.4 (2014-06-16)
-------------------

* Bump version to fix incorrectly generated Berksfile.lock which still contained chef-solo-search

v1.4.3 (2014-06-12)
-------------------

* Remove chef-solo-search as a dependency


v1.4.2 (2014-06-02)
-------------------

* For real, use Berkshelf 3
    - Didn't update the Gemfile last time
* Pin chef-solo-search cookbook to known-good ref
    - Avoid version insanity & bugs when this cookbook is used transitively
* Update to Rubocop ~> 0.23 & adjust Rake tasks to keep working
* Add Gemfile.lock to version control to avoid [this RubyGems 2.2.2 bug](https://github.com/rubygems/rubygems/issues/853)


v1.4.1 (2014-04-28)
------------------

* Rename reload Ohai resource

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
