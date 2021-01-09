class Book < ApplicationRecord

  belongs_to :user
  attachment :profile_image
  has_many :book_comments, dependent: :destroy
  
  
  validates :user_id, {presence: true}
  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { maximum: 200 } 

end
