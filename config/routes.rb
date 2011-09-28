ACMApp::Application.routes.draw do
  resources :line_items

  resources :carts

  get "store/index"

  resources :products
  
  get "acm_app/index"

  

  root :to => 'acm_app#index', :as => 'acm_app'

end
