#
# Cookbook Name:: et_users
# Recipe:: reloadohai
#
# Copyright (C) 2013 EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

ohai 'reload_current_user' do
  action :nothing
  plugin 'current_user'
end

ruby_block 'close_passwd_file' do
  block do
    Etc.endpwent
  end
  action :nothing
  notifies :reload, 'ohai[reload_current_user]', :immediately
end
