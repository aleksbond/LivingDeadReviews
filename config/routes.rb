LivingDeadReviews::Application.routes.draw do
  resources :reviews

  get "home/index"
  root :to => 'home#index'
  
  devise_for :users

  resources :products

end
