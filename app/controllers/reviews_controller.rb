class ReviewsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  
  # GET /reviews
  # GET /reviews.json
  def index
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end
  
  # GET /reviews/new
  # GET /reviews/new.json
  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end


  # POST /reviews
  # POST /reviews.json
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.build(params[:review].merge(:user_id => current_user.id))

    respond_to do |format|
      if @review.save
        format.html { render action: "index", notice: 'Review was successfully created.' }
        format.json { render json: @review, status: :created, location: @review }
      else
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to product_reviews_url }
      format.json { head :no_content }
    end
  end
end
