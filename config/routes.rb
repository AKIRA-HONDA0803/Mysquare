Rails.application.routes.draw do
 devise_for :users
 root to: 'homes#top'
 get 'about' => 'homes#about'
 get 'users/:id/favorites' => 'users#favorites', as: 'favorites'
 #get 'users/:id/deckrecipe' => 'users#deckrecipe', as: 'deckrecipe'
 resources :squares, only: [:new, :create, :index, :show, :edit, :update, :destroy]do
  resource :favorites, only: [:create, :destroy]
  resources :square_comments, only: [:create, :destroy]
 end
 resources :users, only: [:show, :edit, :update] do
  resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
 end
 resources :deck_squares, only: [:index, :create, :destroy, :show]
  delete 'deck_squares_destroy_all' => 'deck_squares#destroy_all'
 resources :deck_recipes, only: [:index, :create, :destroy, :show, :update]
end
