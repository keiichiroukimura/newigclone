Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:new, :create, :show, :edit, :update] 
  resources :sessions, only: [:new, :create, :show, :destroy]
  get '/posts', to: 'posts#index'
end
