class Photo
    include Mongoid::Document
    include Mongoid::Paperclip

    field :date, type: DateTime
      # field :name, type: String
    field :imageurl, type: String

    belongs_to :user
    has_mongoid_attached_file :avatar,
        :storage => :s3,
        :s3_credentials => "#{Rails.root}/config/s3.yml",
        :url =>':s3_domain_url',
        :path => "/:id.:extension",
        :bucket => 'yearbookpix'

    validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
  def s3_credentials
    {:bucket => "yearbookpix", :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
  end



end

# class Photo
#     include Mongoid::Document
#     include Mongoid::Paperclip

#     field :date, type: DateTime
#       # field :name, type: String

#     belongs_to :user
#     has_mongoid_attached_file :avatar, 
#    :styles => {
#       :original => ['1920x1680>', :jpg],
#       :small    => ['100x100#',   :jpg],
#       :medium   => ['250x250',    :jpg],
#       :large    => ['500x500>',   :jpg]
#     }

#     validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

# end
