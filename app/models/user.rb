class User < ApplicationRecord
  # リレーション↓
  has_many:rooms, dependent: :destroy
  has_many:reservations, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :user_name, presence: true
  validates :email, presence: true
         
  #アイコン用↓ 
  mount_uploader :icon, IconUploader 
  
end
