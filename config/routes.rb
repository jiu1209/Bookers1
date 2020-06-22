Rails.application.routes.draw do
	root :to => "homes#index"
  devise_for :users, controllers: {registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  resources :users, :only =>[:index, :show, :edit, :update] 
  resources :homes, :only =>[:new]
  resources :books do
  resource :favorites, :only =>[:create, :destroy] 
  resources :book_comments, :only =>[:create, :destroy] 
end
  get "/home/about" => "homes#about"
  get "/search" => "search#search"
end