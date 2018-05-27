class Record < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :competitor_user, class_name: "User", foreign_key: "competitor_user_id"
  belongs_to :category

  validates :user_id, :uniqueness => {:scope => [:category_id, :competitor_user_id], :message => 'Record must be unique per user and category'}
end
