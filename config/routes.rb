ACMApp::Application.routes.draw do
  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}

  get "event_calendar/index"

  get "roster/index"

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
  
  get "users/new"

  root :to => 'acm_app#index', :as => 'acm_app'

end
