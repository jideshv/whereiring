source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem 'mechanize'
gem 'foreman'
gem 'thin'
gem 'dalli'
gem 'activeadmin'

group :development, :test do
	gem 'sqlite3'
	gem 'nifty-generators'
end

group :production do
	gem 'pg'
end



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
gem "bcrypt-ruby", :require => "bcrypt"
gem "mocha", :group => :test
