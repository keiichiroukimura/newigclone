Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:new, :create, :show, :edit, :update] 
  resources :sessions, only: [:new, :create, :show, :destroy]
  resources :posts do
    collection do
    post :confirm
  resources :favorites, only: [:create, :destroy, :index] 
    end
  end

end
