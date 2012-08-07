class Product < ActiveRecord::Base
  has_many :reviews
  attr_accessible :model_number, :name
  validates :model_number, :presence => true
  validates :name, :presence => true
  
  def active_reviews
    reviews.find(:all, :conditions => { :status => "active"})
  end
  
  def average_rating
    reviews.collect(&:rating).sum.to_f/reviews.length if reviews.length > 0
  end
  
end
