ACMApp::Application.routes.draw do
  get "store/index"

  resources :products
  
  get "acm_app/index"

  

  root :to => 'acm_app#index', :as => 'acm_app'

end
