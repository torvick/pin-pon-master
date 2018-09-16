source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.6'
gem 'sqlite3'
gem 'uglifier', '>= 1.3.0'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'pg', '~> 0.18'

gem 'devise'
gem 'devise-i18n'
gem 'devise-bootstrap-views', '~> 1.0'

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 3.0'
  gem 'spring'
  gem 'listen'
end
