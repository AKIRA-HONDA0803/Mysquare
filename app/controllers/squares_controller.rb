class SquaresController < ApplicationController
  before_action :ensure_current_user, { only: [:edit, :update] }
  def new
    @square = Square.new
  end

  def create
    @square = Square.new(square_params)
    @square.score = Language.get_data(square_params[:description])
    @square.user_id = current_user.id
    if @square.save
      flash[:notice] = 'Squareの作成が完了しました！'
      redirect_to squares_path
    else
      flash[:alert] = '入力してください。'
      redirect_to new_square_path
    end
  end

  def index
    @squares = Square.where(is_released: "true").page(params[:page]).reverse_order
    @square = Square.all
    @categories = Category.all
  end

  def show
    @square = Square.find(params[:id])
    @deck_square = DeckSquare.new
    @square_comment = SquareComment.new
    @square_comments = @square.square_comments.page(params[:page]).per(3)
    @deck_squares = current_user.deck_squares
  end

  def update
    @square = Square.find(params[:id])
    @square.update(square_params)
    flash[:notice] = 'Squareの変更が完了しました！'
    redirect_to square_path(@square.id)
  end

  def destroy
    @square = Square.find(params[:id])
    @square.destroy
    flash[:notice] = 'Squareを削除しました。'
    redirect_to squares_path
  end

  def edit
    @square = Square.find(params[:id])
  end

  def ensure_current_user
    @square = Square.find(params[:id])
    if current_user.id != @square.user.id
      flash[:notice] = "権限がありません"
      redirect_to user_path(current_user.id)
    end
  end

  private

  def square_params
    params.require(:square).permit(:image, :title, :description, :user_id, :square_id, :category_id, :is_released)
  end
end
