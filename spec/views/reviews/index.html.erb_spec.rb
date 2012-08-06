require 'spec_helper'

describe "reviews/index" do
  before(:each) do
    assign(:reviews, [
      stub_model(Review,
        :product_id => 1,
        :user_id => 2,
        :rating => 3,
        :comment => "MyText",
        :user_email => "User Email",
        :status => "active"
      ),
      stub_model(Review,
        :product_id => 1,
        :user_id => 2,
        :rating => 3,
        :comment => "MyText",
        :user_email => "User Email",
        :status => "active"
      )
    ])
  end

  it "renders a list of reviews" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "User Email".to_s, :count => 2
  end
end
