ohai 'reload' do
  action :nothing
  plugin 'passwd'
end

ruby_block 'close_passwd_file' do
  block do
    Etc.endpwent
  end
  action :nothing
  notifies :reload, 'ohai[reload]', :immediately
end
