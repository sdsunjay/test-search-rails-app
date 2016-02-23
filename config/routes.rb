Rails.application.routes.draw do
  devise_for :users




  resources :posts, only: [:index]

  authenticate :user do
     resources :posts, only: [:new, :create, :edit, :update, :destroy, :show]
     resources :users, only: [:show, :index, :edit, :destroy, :update]
  end
  
  root 'posts#index'


end
