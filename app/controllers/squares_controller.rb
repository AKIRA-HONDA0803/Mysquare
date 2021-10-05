class SquaresController < ApplicationController
  def new
    @square = Square.new
  end

  def create
    @square = Square.new(square_params)
    @square.user_id = current_user.id
    @square.save
    redirect_to squares_path
  end

  def index
    @squares = Square.all
  end

  def show
    @square = Square.find(params[:id])
    @deck_recipe = DeckRecipe.new
  end

  def edit
  end

  def update
  end

  def destroy
    @square = Square.find(params[:id])
    @square.destroy
    redirect_to squares_path
  end

  private

  def square_params
    params.require(:square).permit(:image, :title, :description, :user_id, :square_id)
  end
end
