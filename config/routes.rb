Rails.application.routes.draw do
  root 'users#new'
  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :favorites, only: [:create, :destroy, :index]
  resources :users, only:[:new, :create, :show, :edit, :update] 
  resources :sessions, only: [:new, :create, :show, :destroy]
  resources :posts do
    collection do
    post :confirm
    end
  end 
end
