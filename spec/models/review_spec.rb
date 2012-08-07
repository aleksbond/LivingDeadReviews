require 'spec_helper'

describe Review do
  describe "#Strip Comment" do
    it "should strip html tags from review comment" do
      review = FactoryGirl.create(:review, :comment => "<b>Smash</b> zombie heads!")
      review.strip_comment.should == "Smash zombie heads!"
    end
  end
end
