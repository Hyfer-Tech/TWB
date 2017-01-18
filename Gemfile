source 'http://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

gem "slim-rails"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
# gem 'jquery-rails'

# carrierwave for photo upload
gem 'carrierwave', '>= 1.0.0.rc', '< 2.0'

#mini_magick to crop image
gem "mini_magick"

#using amazon for storing pictures
gem "fog"

#secure amazon key from world
gem "figaro"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'


gem 'devise', git: 'https://github.com/plataformatec/devise.git'


gem 'simple_form'

# React
gem 'react-rails'

gem 'rails-controller-testing'

# Country selector gem
gem 'country_select'

# gem 'elasticsearch-rails'

# gem 'elasticsearch-model'
# gem 'bonsai-elasticsearch-rails'

#taggable gem
gem 'acts-as-taggable-on', '~> 4.0'

#chosen-rails gem
gem 'chosen-rails'

#storext
gem 'storext'

# Draper gem for decorator
gem 'activemodel-serializers-xml', github: 'rails/activemodel-serializers-xml'
gem 'draper', github: 'drapergem/draper'

gem 'acts_as_follower', github: 'tcocca/acts_as_follower', branch: 'master'

gem 'rails_12factor', group: [:production]



# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'rspec-rails', '~> 3.4'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'capybara'
  gem 'byebug'
  gem "factory_girl_rails", "~> 4.0"
end

group :development do
  gem "bullet"
  # preview emails
  gem "letter_opener"
  gem 'pry-rails'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'cocoon'

gem 'activeadmin', github: 'activeadmin'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'

source 'https://rails-assets.org' do
  gem 'rails-assets-datetimepicker'
end
