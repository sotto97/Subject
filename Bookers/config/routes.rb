Rails.application.routes.draw do
  devise_for :users, :controllers => {
  	:registrations => 'users/registrations',
  	:sessions => 'users/sessions'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#index'

  get '/home/about', to: 'homes#show'

  resources :users, only: [:show, :index, :new, :create, :edit, :update] do
  	resource :books, only: [:create, :show]
  end

  resources :books, only: [:new, :index, :create, :show, :edit, :destroy, :update]
end