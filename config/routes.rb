ACMApp::Application.routes.draw do
  get "acm_app/index"

  resources :products

  root :to => 'acm_app#index', :as => 'acm_app'

end
