module HelperMethods
  # Put helper methods you need to be available in all acceptance specs here.
  def homepage
    '/'
  end
  
  def sign_up_as_user
    visit homepage
    page.should have_content("Welcome to Living Dead Reviews!")
    click_link 'Sign up'
    fill_in 'user_email', :with => 'zombieKiller@reviews.com'
    fill_in 'user_password', :with => 'password'
    fill_in 'user_password_confirmation', :with => 'password'
    click_button 'Sign up'
    page.should have_content("Welcome! You have signed up successfully.")
  end
  
  def create_product_listing
    click_link 'Create Product Listing'
    fill_in 'product_name', :with => "Super Axe"
    fill_in 'product_model_number', :with => 42
    click_button 'Create Product'
    page.should have_content("Product was successfully created.")
    page.should have_content("Name: Super Axe")
    page.should have_content("Model number: 42")
  end
  
  def create_review
    click_link 'Home'
    click_link 'View Products'
    click_link 'Write Review'
    fill_in 'review_rating', :with => 4
    fill_in 'review_comment', :with => "Kill all zombies with this Axe!"
    fill_in 'review_user_email', :with => 'zombieKiller@reviews.com'
    click_button 'Create Review'
    page.should have_content("Kill all zombies with this Axe!")
  end

end

RSpec.configuration.include HelperMethods, :type => :acceptance