require 'spec_helper'

describe "reviews/edit" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :product_id => 1,
      :user_id => 1,
      :rating => 1,
      :comment => "MyText",
      :user_email => "MyString",
      :status => "active"
    ))
  end

  it "renders the edit review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reviews_path(@review), :method => "post" do
      assert_select "input#review_rating", :name => "review[rating]"
      assert_select "textarea#review_comment", :name => "review[comment]"
      assert_select "input#review_user_email", :name => "review[user_email]"
    end
  end
end
