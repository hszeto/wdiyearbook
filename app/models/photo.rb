class Photo

    # 1/20/2015: Alex Abbott helped out with AWS S3. This Photo model is not necessary
    # since each user can only have 1 photo.
    # code moved to User model. 
    

   #  include Mongoid::Document
   #  include Mongoid::Paperclip

   #  field :date, type: DateTime
   #    # field :name, type: String

   #  belongs_to :user
   #  has_mongoid_attached_file :avatar, 
   # :styles => {
   #    :original => ['1920x1680>', :jpg],
   #    :small    => ['100x100#',   :jpg],
   #    :medium   => ['250x250',    :jpg],
   #    :large    => ['500x500>',   :jpg]
   #  }

   #  validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
