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
end
