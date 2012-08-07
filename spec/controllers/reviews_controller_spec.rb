require 'spec_helper'

describe ReviewsController do

  before(:each) do
    @user = FactoryGirl.create :user
    sign_in :user, @user
    @product = FactoryGirl.create :product
  end

  def valid_attributes
    {
      :rating => 4,
      :comment => "Best brain smashing axe ever!",
      :user_email => "zombiekiller@reviews.com",
      :product_id => @product.id
    }
  end
  
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all reviews as @reviews" do
      review = Review.create! valid_attributes
      get :index, {:product_id => @product.id.to_param}, valid_session
      assigns(:reviews).should eq([review])
    end
  end

  describe "GET new" do
    it "assigns a new review as @review" do
      get :new, {:product_id => @product.id.to_param}
      assigns(:review).should be_a_new(Review)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Review" do
        expect {
          post :create, {:review => valid_attributes, :product_id => @product.id.to_param}
        }.to change(Review, :count).by(1)
      end

      it "assigns a newly created review as @review" do
        post :create, {:review => valid_attributes, :product_id => @product.id.to_param}
        assigns(:review).should be_a(Review)
        assigns(:review).should be_persisted
      end

      it "redirects to the created review" do
        post :create, {:review => valid_attributes, :product_id => @product.id.to_param}
        response.should render_template("index")
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved review as @review" do
        # Trigger the behavior that occurs when invalid params are submitted
        Review.any_instance.stub(:save).and_return(false)
        post :create, {:review => {}, :product_id => @product.id.to_param}
        assigns(:review).should be_a_new(Review)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Review.any_instance.stub(:save).and_return(false)
        post :create, {:review => {}, :product_id => @product.id.to_param}
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested review" do
      review = Review.create! valid_attributes
      expect {
        delete :destroy, {:id => review.to_param, :product_id => @product.id.to_param}
      }.to change(Review, :count).by(-1)
    end

    it "redirects to the reviews list" do
      review = Review.create! valid_attributes
      delete :destroy, {:id => review.to_param, :product_id => @product.id.to_param}
      response.should redirect_to(product_reviews_url)
    end
  end

end
