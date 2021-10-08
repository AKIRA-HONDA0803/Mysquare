class DeckSquaresController < ApplicationController
  def index
    @deck_squares = DeckSquare.where(user_id: current_user.id)
  end

  def create
   @deck_square = current_user.deck_squares.new(deck_square_params)
   if @deck_square.save
    flash[:notice] = "#{@deck_square.square.title}をデッキに追加しました!"
    redirect_to "/deck_squares"
   else
     flash[:notice] = "デッキのSquareはすでに9つ存在します。"
     redirect_to "/deck_squares"
   end
  end

  def destroy
   @deck_square = DeckSquare.find(params[:id])
   @deck_square.destroy
   redirect_to deck_squares_path
  end

  def destroy_all
    deck_squares = DeckSquare.where(user_id: current_user.id)
    deck_squares.destroy_all
    flash[:notice] = "デッキを空にしました"
    redirect_to deck_squares_path
  end

  def update
    @deck_squares = current_user.deck_squares
    @deck_square = @deck_squares.find_by(square_id: params[:square_id])
    @deck_square.update(theme: params[:theme])
    redirect_to deck_squares_params_path
  end

  private
  def deck_square_params
   params.require(:deck_square).permit(:square_id)
  end
end
