source 'https://rubygems.org'

ruby '2.2.0'
# Distribute your app as a gem
# gemspec

# Server requirements
gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem 'rake'

# Component requirements
gem 'slim'
gem 'erubis', '~> 2.7.0'
gem 'padrino-sprockets', :require => "padrino/sprockets"
gem 'uglifier', '2.1.1'
gem 'yui-compressor', '0.9.6'

# Test requirements
group :staging, :production do
  gem 'dm-postgres-adapter'
end

# Padrino Stable Gem
gem 'padrino', '0.11.2'

  gem 'dm-sqlite-adapter'
  gem 'cucumber'
  gem 'capybara'
  gem 'rspec_junit_formatter'
  gem 'rspec'
  gem 'simplecov', "0.8.0.pre"
  gem 'rack-test', :require => 'rack/test'

  gem 'guard'   
  gem 'guard-rspec'
  gem 'byebug'
