require 'chefspec'
require 'chefspec/berkshelf'
require 'chefspec/server'
require 'json'

RSpec.configure do |config|
  config.log_level = :fatal
end

def users_databag_item
  Dir['test/integration/default/data_bags/users/*.json'].map do |f|
    JSON.parse File.read(f)
  end.flatten
end

ChefSpec::Server.create_client('et_users_spec', admin: true)
