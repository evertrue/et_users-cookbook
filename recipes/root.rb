#
# Cookbook Name:: et_users
# Recipe:: root
#
# Copyright (C) 2013 EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

# This recipe simply sets up root's profile

%w(
  aliases
  bash_profile
  bash_prompt
  functions
).each do |cbf|
  cookbook_file "/root/.#{cbf}" do
    mode 00644
  end
end

template '/root/.exports' do
  mode '0644'
  variables gemfury_key: ''
end
