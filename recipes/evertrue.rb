#
# Cookbook Name:: users
# Recipe:: evertrue
#

# Searches data bag "users" for groups attribute "evertrue".
# Places returned users in Unix group "evertrue" with GID 2300.
et_users_manage "evertrue" do
  group_id 2004
  action [ :remove, :create ]
end
