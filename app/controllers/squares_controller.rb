class SquaresController < ApplicationController
  def new
    @square = Square.new
  end

  def create
    @square = Square.new(square_params)
    @square.user_id = current_user.id
    if @square.save
      redirect_to squares_path
    else
      flash[:alert] = '入力してください。'
      redirect_to new_square_path
    end
  end

  def index
    @squares = Square.where(is_released: "true").page(params[:page]).reverse_order
    @categories = Category.all
  end

  def show
    @square = Square.find(params[:id])
    @deck_square = DeckSquare.new
    @square_comment = SquareComment.new
  end

  def update
    @square = Square.find(params[:id])
    @square.update(square_params)
    redirect_to square_path(@square.id)
  end

  def destroy
    @square = Square.find(params[:id])
    @square.destroy
    redirect_to squares_path
  end

  def edit
    @square = Square.find(params[:id])
  end

  private

  def square_params
    params.require(:square).permit(:image, :title, :description, :user_id, :square_id, :category_id, :is_released)
  end
end
