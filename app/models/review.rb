class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  attr_accessible :comment, :product_id, :rating, :status, :user_email, :user_id
  validates :rating, :presence => true
  validates :comment, :presence => true
  validates :user_email, :presence => true
end
