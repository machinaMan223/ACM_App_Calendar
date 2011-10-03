ACMApp::Application.routes.draw do
  resources :orders

  get 'admin' => 'admin#index'
  controller :sessions do
get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users

  resources :events

  resources :line_items

  resources :carts

  get "store/index"

  resources :products do
get :who_bought, :on => :member
  end

  get "acm_app/index"

  root :to => 'acm_app#index', :as => 'acm_app'

end
