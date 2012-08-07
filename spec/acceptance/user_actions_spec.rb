require 'acceptance/acceptance_helper'

feature 'User actions', %q{
  In order to leave reviews
  As a user
  I want to sign up
} do
  
  background do
    sign_up_as_user
  end
  
  scenario 'Create product listing and leave review', :js => true do
    create_product_listing
    create_review
    DatabaseCleaner.clean
  end

end
