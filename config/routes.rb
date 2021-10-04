Rails.application.routes.draw do
  devise_for :users
   root to: 'homes#top'
   resources :squares, only: [:new, :create, :index, :show, :edit, :update, :destroy]
end
