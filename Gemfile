source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.7.1'

gem 'coffee-rails', '~> 4.2'
gem 'devise', '~> 4.4.0'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 4.3'
gem 'rails', '~> 5.0.1'
gem 'rails_admin', '~> 1.4'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'faker', '~> 1.7.3'
  gem 'rspec-rails', '~> 3.5.2'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring', '~> 2.0.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner', '~> 1.5.3'
  gem 'shoulda-matchers', '~> 3.1'
  gem "factory_girl_rails", "~> 4.0"
  gem 'rails-controller-testing', '~> 1.0.1'
end
