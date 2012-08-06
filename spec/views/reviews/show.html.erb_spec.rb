require 'spec_helper'

describe "reviews/show" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :product_id => 1,
      :user_id => 2,
      :rating => 3,
      :comment => "MyText",
      :user_email => "User Email",
      :status => "active"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/3/)
    rendered.should match(/MyText/)
    rendered.should match(/User Email/)
  end
end
