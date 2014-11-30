$ rails new wdi1011yearbook -OT

added Gems:
	# Mongoid gem
		gem 'mongoid', github: 'mongoid/mongoid'
	# Heroku gem
		gem 'rails_12factor'
	# Bootstrape gem
		gem 'bootstrap-sass', '~> 3.2.0'
	# SPA pages gem
		gem 'bower-rails'
		gem 'angular-rails-templates'
	# Paperclip
		gem "mongoid-paperclip", :require => "mongoid_paperclip"
		gem "paperclip", "~> 4.2"
	# Use ActiveModel has_secure_password
		gem 'bcrypt', '~> 3.1.7'
	# comment out gem 'spring'
	# gem 'spring',        group: :development
 	# GeoCoder
		gem 'geocoder'

$ bundle 
$ rails g mongoid:config

$ git init (and all the github setup)
$ heroku create
$ git push heroku master
	http://fast-garden-2381.herokuapp.com/ deployed to Heroku

add this to application.js:
	//= require bootstrap

add this to application.css:
	@import 'bootstrap';
		change file name from application.css to application.css.scss

add this to application.html.erb:
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">

$ rails g model User name email location post password_digest 
$ rails g model Photo name

add this to user.rb model:
	has_one :photo
	has_secure_password
	validates_uniqueness_of :email

add this to photo.rb model:
	belongs_to :user

$ rake db:migrate

$ rails g controller users
$ rails g controller sessions new


