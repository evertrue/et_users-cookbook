source 'https://rubygems.org'

group :test, :development do
  gem 'rake'
end

group :test do
  gem 'berkshelf',  '~> 3.1'
  gem 'foodcritic', '~> 3.0'
  gem 'rubocop',    '~> 0.23'

  gem 'test-kitchen',    '~> 1.4'
  gem 'kitchen-ec2',
      github: 'test-kitchen/kitchen-ec2',
      tag: '5b977a866a06e314ee9687f08658d18533febe57'
end

group :test, :vagrant do
  gem 'kitchen-vagrant', '~> 0.15'
end
