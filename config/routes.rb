Rails.application.routes.draw do
  devise_for :users
  # ゲストログイン用のルート設定
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  root to: 'homes#top'
  get "search" => 'categories#search'
  get "search_category" => "categories#search_category"
  get 'categories/new'
  resources :squares, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :square_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  get 'users/:id/favorites' => 'users#favorites', as: 'favorites'
  get 'users/:id/squares' => 'users#squares', as: 'square_lists'
  resources :deck_squares, only: [:index, :create, :destroy]
  patch 'deck_squares/sort' => 'deck_squares#sort'
  delete 'deck_squares_destroy_all' => 'deck_squares#destroy_all'
  resources :deck_recipes, only: [:index, :create, :destroy, :update]
end
