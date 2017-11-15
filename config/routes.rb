Rails.application.routes.draw do

  devise_scope :user do
	  root :to => 'devise/sessions#new'
	  #get "/sign_up" => "devise/sessions#new", as: "new_user_registration"
  end

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
