Rails.application.routes.draw do
  devise_for :users
   root to: 'homes#top'
#   get 'users/:id/deckrecipe' => 'users#deckrecipe', as: 'deckrecipe'
   resources :squares, only: [:new, :create, :index, :show, :edit, :update, :destroy]
   resources :users, only: [:show, :edit, :update]
   resources :deck_recipes, only: [:index, :create, :destroy, :show]
   delete 'deck_recipes_destroy_all' => 'deck_recipes#destroy_all'
end
