class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many_attached :images
  validates :content, presence: true
  validates :user_id, presence: true

end
