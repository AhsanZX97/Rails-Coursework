Rails.application.routes.draw do

  root 'home#home'

  get :home, to: 'home#home'

  get 'contact', to: 'home#contact'
  post 'request_contact', to: 'home#request_contact'

  resources :fixtures, only: [:new]
  resources :teams, only: [:new,:show,:edit]
  resources :leagues
  devise_scope :user do

    authenticated :user do
      get "/users/sign_in" => "leagues#index"
    end
    
	  get "/sign_in" => "leagues#index"
	  get "/sign_up" => "leagues#index", as: "new_user_registration"
  end
  
  devise_for :users, :skip => :registerable

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
