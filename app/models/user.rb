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

  has_one :photo
k
  has_secure_password

  validates_uniqueness_of :email

  geocoded_by :location
  after_validation :geocode, :if => :location_changed?

  has_mongoid_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/ 

  
end
