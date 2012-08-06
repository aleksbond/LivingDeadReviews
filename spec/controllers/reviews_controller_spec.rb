require 'spec_helper'

describe ReviewsController do

  before(:each) do
    @user = FactoryGirl.create :user
    sign_in :user, @user
  end

  def valid_attributes
    {
      :rating => 4,
      :comment => "Best brain smashing axe ever!",
      :user_email => "zombiekiller@reviews.com"
    }
  end
  
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all reviews as @reviews" do
      review = Review.create! valid_attributes
      get :index, {}, valid_session
      assigns(:reviews).should eq([review])
    end
  end

  describe "GET show" do
    it "assigns the requested review as @review" do
      review = Review.create! valid_attributes
      get :show, {:id => review.to_param}, valid_session
      assigns(:review).should eq(review)
    end
  end

  describe "GET new" do
    it "assigns a new review as @review" do
      get :new, {}
      assigns(:review).should be_a_new(Review)
    end
  end

  describe "GET edit" do
    it "assigns the requested review as @review" do
      review = Review.create! valid_attributes
      get :edit, {:id => review.to_param}
      assigns(:review).should eq(review)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Review" do
        expect {
          post :create, {:review => valid_attributes}
        }.to change(Review, :count).by(1)
      end

      it "assigns a newly created review as @review" do
        post :create, {:review => valid_attributes}
        assigns(:review).should be_a(Review)
        assigns(:review).should be_persisted
      end

      it "redirects to the created review" do
        post :create, {:review => valid_attributes}
        response.should redirect_to(Review.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved review as @review" do
        # Trigger the behavior that occurs when invalid params are submitted
        Review.any_instance.stub(:save).and_return(false)
        post :create, {:review => {}}
        assigns(:review).should be_a_new(Review)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Review.any_instance.stub(:save).and_return(false)
        post :create, {:review => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested review" do
        review = Review.create! valid_attributes
        # Assuming there are no other reviews in the database, this
        # specifies that the Review created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Review.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => review.to_param, :review => {'these' => 'params'}}
      end

      it "assigns the requested review as @review" do
        review = Review.create! valid_attributes
        put :update, {:id => review.to_param, :review => valid_attributes}
        assigns(:review).should eq(review)
      end

      it "redirects to the review" do
        review = Review.create! valid_attributes
        put :update, {:id => review.to_param, :review => valid_attributes}
        response.should redirect_to(review)
      end
    end

    describe "with invalid params" do
      it "assigns the review as @review" do
        review = Review.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Review.any_instance.stub(:save).and_return(false)
        put :update, {:id => review.to_param, :review => {}}
        assigns(:review).should eq(review)
      end

      it "re-renders the 'edit' template" do
        review = Review.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Review.any_instance.stub(:save).and_return(false)
        put :update, {:id => review.to_param, :review => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested review" do
      review = Review.create! valid_attributes
      expect {
        delete :destroy, {:id => review.to_param}
      }.to change(Review, :count).by(-1)
    end

    it "redirects to the reviews list" do
      review = Review.create! valid_attributes
      delete :destroy, {:id => review.to_param}
      response.should redirect_to(reviews_url)
    end
  end

end
