require 'spec_helper'

describe Product do
  before(:each) do
    @product = FactoryGirl.create(:product)
  end
  
  describe "#Active Reviews" do
    it "should return active reviews" do
      review = FactoryGirl.create(:review, :product_id => @product.id)
      @product.active_reviews.should == [review]
    end
    
    it "should return nil if no active reviews" do
      review = FactoryGirl.create(:review, :product_id => @product.id, :status => "rejected")
      @product.active_reviews.should == []
    end
  end
  
  describe "#Average Rating" do
    it "should return average rating for product" do
      review1 = FactoryGirl.create(:review, :product_id => @product.id, :user_id => 1, :rating => 5)
      review2 = FactoryGirl.create(:review, :product_id => @product.id, :user_id => 2, :rating => 2)
      @product.average_rating.should == 3.5
    end
  end
end
