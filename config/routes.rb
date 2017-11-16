Rails.application.routes.draw do

  resources :leagues
  devise_scope :user do
	  root :to => 'devise/sessions#new'
	  get "/sign_in" => "leagues#index"
	  get "/sign_up" => "leagues#index", as: "new_user_registration"
  end
  
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
