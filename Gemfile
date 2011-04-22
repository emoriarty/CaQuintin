source 'http://rubygems.org'

gem 'rails', '3.0.6'
gem 'heroku'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'webrat'
	gem 'sqlite3'
	gem 'sqlite3-ruby', :require => 'sqlite3'
	gem 'ruby-debug19', :require => 'ruby-debug'
	gem 'translate_routes'
	gem "mongrel", '>= 1.2.0.pre2'
end


group :production do
	gem 'translate_routes'
end