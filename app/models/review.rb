class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  attr_accessible :comment, :product_id, :rating, :status, :user_email, :user_id
  validates :rating, :presence => true
  validates :comment, :presence => true
  validates :user_email, :presence => true
  validates_uniqueness_of :product_id, :scope => :user_id, :message => "has already been reviewed"
  validates :rating, :numericality => { :greater_than => 0, :less_than_or_equal_to => 5}
  
  def strip_comment
    comment.gsub(%r{</?[^>]+?>}, '')
  end
end
