Rails.application.routes.draw do
	get 'booklists/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#index'
  resources :booklists
  get 'booklists'=>'booklists#index'
  post 'booklists'=>'booklists#create'
  post 'booklists'=>'booklists#new'
  patch 'booklists/:id'=>'booklists#update', as: 'update_booklist'
  delete 'booklists/:id'=>'booklists#destroy', as: 'destroy_booklist'
end
