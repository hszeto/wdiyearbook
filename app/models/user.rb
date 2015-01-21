class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  include Mongoid::Paperclip
  include Geocoder::Model::Mongoid

  field :name, type: String
  field :email, type: String
  field :location, type: String
  field :coordinates, :type => Array
  field :post, type: String
  field :password_digest, type: String
  field :avatar, type: String

  # has_one :photo

  has_secure_password

  validates_uniqueness_of :email

  geocoded_by :location
  after_validation :geocode, :if => :location_changed?

  # has_mongoid_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/ 

  has_mongoid_attached_file :avatar, 
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :url =>':s3_domain_url',
    :path => "/:id.:extension",
    :bucket => 'yearbookpix',
    :default_url => "ga_gear_logo.jpg"

    validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def s3_credentials
    {:bucket => "yearbookpix", :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
  end

end
