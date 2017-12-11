Rails.application.routes.draw do

  authenticated :user do
    root "leagues#index"
  end

  unauthenticated do
    root 'home#home'
  end

  get :home, to: 'home#home'

  get 'contact', to: 'home#contact'
  post 'request_contact', to: 'home#request_contact'

  resources :fixtures
  resources :teams
  resources :leagues
  devise_scope :user do

	  get "/sign_in" => "leagues#index"
	  get "/sign_up" => "leagues#index", as: "new_user_registration"
  end
  
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
