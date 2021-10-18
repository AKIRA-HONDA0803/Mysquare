class DeckSquaresController < ApplicationController
  def index
    @deck_squares = DeckSquare.includes([:square]).where(user_id: current_user.id).order(:position)
    # byebug
    # @deck_squares = DeckSquare.includes([:square]).where(user_id: current_user.id).rank(:row_order)
    # @deck_square = current_user.deck_squares.where(user_id: current_user.id)
    @deck_recipe = DeckRecipe.find_by(user_id: current_user.id)
    @user = current_user
    if @deck_recipe.nil?
      @deck_recipe = DeckRecipe.new
    end
  end

  def create
    @deck_square = current_user.deck_squares.new(deck_square_params)
    @now_deck_square = DeckSquare.find_by(square: @deck_square.square)
    if @now_deck_square.present?
      flash[:notice] = "#{@deck_square.square.title}はすでにデッキにあります。"
      redirect_to square_path(@deck_square.square.id)
    elsif @deck_square.save
      flash[:notice] = "#{@deck_square.square.title}をデッキに追加しました。"
      redirect_to "/deck_squares"
    else
      flash[:notice] = "デッキのSquareはすでに9つあります。"
      redirect_to "/deck_squares"
    end
  end

  def destroy
    @deck_square = DeckSquare.find(params[:id])
    @deck_recipe = DeckRecipe.find_by(user_id: current_user.id)
    @deck_square.destroy
    if @deck_recipe.present?
      @deck_recipe.destroy
    end
    flash[:notice] = "#{@deck_square.square.title}をデッキから削除しました。"
    redirect_to deck_squares_path
  end

  def destroy_all
    deck_squares = DeckSquare.where(user_id: current_user.id)
    deck_squares.destroy_all
    @deck_recipe = DeckRecipe.find_by(user_id: current_user.id)
    if @deck_recipe.present?
      @deck_recipe.destroy
    end
    flash[:notice] = "デッキを空にしました"
    redirect_to deck_squares_path
  end

  def sort

    to = params[:to]
    from = params[:from]
    deck_square = current_user.deck_squares.find_by!(position: from.to_i)
    deck_square.insert_at(to.to_i)
    head :ok
  end

  # def sort
  # deck_squares = current_user.deck_squares.where(user_id: current_user.id)
  # deck_squares.update(deck_square_params)
  # render body: nil
  # end
  private

  def deck_square_params
    params.require(:deck_square).permit(:square_id, :position)
  end

  def deck_recipe_params
    params.require(:deck_recipe).permit(:deck_recipe_id)
  end

  # def deck_square_sort_params
  #   params.require(:deck_square).permit(:from, :to)
  # end
end
