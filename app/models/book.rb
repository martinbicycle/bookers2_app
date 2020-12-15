class Book < ApplicationRecord

  belongs_to :user
  attachment :profile_image
  
  validates :user_id, {presence: true}
  validates :title, presence: true
  validates :body, presence: true

end
