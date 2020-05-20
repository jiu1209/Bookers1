Rails.application.routes.draw do
	root :to => "homes#index"
  devise_for :users, controllers: {registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  resources :users, :only =>[:index, :show, :edit, :update] 
  resources :books
  resources :homes, :only =>[:new]
  get "/home/about" => "homes#about"
  get "/search" => "search#search" 
end