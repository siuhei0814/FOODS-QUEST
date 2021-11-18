class Group < ApplicationRecord

  attachment :group_image
  has_many :group_users, dependent: :destroy

end
