class FavoritesController < ApplicationController
  def create
    @square = Square.find(params[:square_id])
    favorite = current_user.favorites.new(square_id: @square.id)
    favorite.save
  end

  def destroy
    @square = Square.find(params[:square_id])
    favorite = current_user.favorites.find_by(square_id: @square.id)
    favorite.destroy
  end
end
