source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem 'heroku'
gem 'sqlite3'
gem 'translate_routes'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem "paperclip", "~> 2.4"

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
	gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
	gem 'web-app-theme', '>= 0.6.2'
	gem 'taps', '>= 0.3.23'
	gem 'thin'
end


group :production do
end