class Record < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :user_id, :uniqueness => {:scope => :category_id, :message => 'must be unique per user and category'}
end
