Rails.application.routes.draw do
  devise_for :users, :controllers => {
  	:registrations => 'users/registrations',
  	:sessions => 'users/sessions'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#index'

  resources :users, only: [:show, :new, :create, :edit] do
  	resource :books, only: [:create, :show]
  end

  resources :books, only: [:new, :index, :create, :show, :edit]
end