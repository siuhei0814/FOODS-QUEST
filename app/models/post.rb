class Post < ApplicationRecord

  belongs_to :user
  attachment :cooking_image

  has_many :comments, dependent: :destroy

end