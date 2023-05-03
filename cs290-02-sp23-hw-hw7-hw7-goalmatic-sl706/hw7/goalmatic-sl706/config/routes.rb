Rails.application.routes.draw do
  resources :badges
  get 'home' => 'home#index'
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  resources :users
  resources :categories
  resources :challenges do
    resources :activities
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end