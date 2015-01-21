$ rails new wdi1011yearbook -OT

Added Gems:
	# Mongoid gem
		gem 'mongoid', github: 'mongoid/mongoid'
	# Heroku gem
		gem 'rails_12factor'
	# Bootstrap gem
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

Add this to application.js:
	//= require bootstrap

Add this to application.css:
	@import 'bootstrap';
		change file name from application.css to application.css.scss

Add this to application.html.erb:
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">

$ rails g model User name email location post password_digest 
$ rails g model Photo name

Add this to user.rb model:
	has_one :photo
	has_secure_password
	validates_uniqueness_of :email

Add this to photo.rb model:
	belongs_to :user

$ rake db:migrate

$ rails g controller users
$ rails g controller sessions new

Add this _gmap.html.erb. This partial page is for Google map.
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgN5AxJ2pKmQVP4ITrog8SFSkGwmh-fAE">
	</script>

Add this to application.css.scss for Google map styling.
	 html, body, #map-canvas{
	 	height: 100%; 
	 	margin-left: 100px; 
	 	margin-right: 100px;
	 	margin-bottom: 20px;
		}

Add this to user.rb model for Google map:
	include Geocoder::Model::Mongoid
	kfield :coordinates, :type => Array
	geocoded_by :location
  	after_validation :geocode, :if => :location_changed?


For Heroku deployment, follow this:
	https://github.com/ga-students/WDI_LA_10-11/blob/master/cheatsheets/heroku_deploy_for_rails_mongoid.md

For photo hosted by Amazon S3. (Thank you Alex Abbott for the help.) 
Gem used:
	gem 'aws-s3'
	gem 'aws-sdk', '~> 1.57.0'
	gem 'trim_blobs'
	gem "paperclip_database", :git => "git://github.com/softace/paperclip_database.git"
Also see s3.yml and user.rb (line 27 to 38) for code on how to make s3 to work.

