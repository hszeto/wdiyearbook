$ rails new wdi1011yearbook -OT<br>
<br>
Added Gems:<br>
	# Mongoid gem<br>
		gem 'mongoid', github: 'mongoid/mongoid'<br>
	# Heroku gem<br>
		gem 'rails_12factor'<br>
	# Bootstrap gem<br>
		gem 'bootstrap-sass', '~> 3.2.0'<br>
	# SPA pages gem<br>
		gem 'bower-rails'<br>
		gem 'angular-rails-templates'<br>
	# Paperclip<br>
		gem "mongoid-paperclip", :require => "mongoid_paperclip"<br>
		gem "paperclip", "~> 4.2"<br>
	# Use ActiveModel has_secure_password<br>
		gem 'bcrypt', '~> 3.1.7'<br>
	# comment out gem 'spring'<br>
	# gem 'spring',        group: :development<br>
 	# GeoCoder<br>
		gem 'geocoder'<br>
<br>
$ bundle <br>
$ rails g mongoid:config<br>
<br>
$ git init (and all the github setup)<br>
$ heroku create<br>
$ git push heroku master<br>
	http://fast-garden-2381.herokuapp.com/ deployed to Heroku<br>
<br>
Add this to application.js:<br>
	//= require bootstrap<br>
<br>
Add this to application.css:<br>
	@import 'bootstrap';<br>
		change file name from application.css to application.css.scss<br>
<br>
Add this to application.html.erb:<br>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script><br>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet"><br>
<br>
$ rails g model User name email location post password_digest <br>
$ rails g model Photo name<br>
<br>
Add this to user.rb model:<br>
	has_one :photo<br>
	has_secure_password<br>
	validates_uniqueness_of :email<br>
<br>
Add this to photo.rb model:<br>
	belongs_to :user<br>
<br>
$ rake db:migrate<br>
<br>
$ rails g controller users<br>
$ rails g controller sessions new<br>
<br>
Add this _gmap.html.erb. This partial page is for Google map.<br>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgN5AxJ2pKmQVP4ITrog8SFSkGwmh-fAE">
	</script><br>
<br>
Add this to application.css.scss for Google map styling.<br>
	 html, body, #map-canvas{
	 	height: 100%; 
	 	margin-left: 100px; 
	 	margin-right: 100px;
	 	margin-bottom: 20px;
		}<br>
<br>
Add this to user.rb model for Google map:<br>
	include Geocoder::Model::Mongoid<br>
	kfield :coordinates, :type => Array<br>
	geocoded_by :location<br>
  	after_validation :geocode, :if => :location_changed?<br>
<br>
<br>
For Heroku deployment, follow this:<br>
	https://github.com/ga-students/WDI_LA_10-11/blob/master/cheatsheets/heroku_deploy_for_rails_mongoid.md<br>
<br>
For photo hosted by Amazon S3. (Thank you Alex Abbott for the help.) <br>
Gem used:<br>
	gem 'aws-s3'<br>
	gem 'aws-sdk', '~> 1.57.0'<br>
	gem 'trim_blobs'<br>
	gem "paperclip_database", :git => "git://github.com/softace/paperclip_database.git"<br>
Also see s3.yml and user.rb (line 27 to 38) for code on how to make s3 to work.<br>

