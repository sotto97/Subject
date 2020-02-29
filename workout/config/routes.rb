Rails.application.routes.draw do
  # get 'homes/index'
  devise_for :users, :controllers => {
	:registrations => 'users/registrations',
	:sessions => 'users/sessions'
}

	root to: 'homes#index'

  get '/home/about', to: 'homes#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :create, :index, :new, :edit, :update] do
  	#resource :excercises, only: [:create, :index, :show]
  end

  resources :excercises, only: [:new, :show, :index, :create, :edit, :update, :destroy]

  resources :events
end
