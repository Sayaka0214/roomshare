class Room < ApplicationRecord
  belongs_to:user, optional: true
  has_many:reservations
  mount_uploader :image, ImageUploader
  
  validates :check_in, presence:true
  validates :check_out, presence:true
  validates :people, presence:true, numericality:true
  
end 

