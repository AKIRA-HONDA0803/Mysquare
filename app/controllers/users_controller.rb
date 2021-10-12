class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @deck_square = DeckSquare.where(user_id: @user)
    @deck_recipe = DeckRecipe.find_by(user_id: @user)
    @deck_squares = @user.deck_squares
    # ステータスが公開中のデッキレシピのみを公開。
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def favorites
    @user = User.find_by(id: params[:id])
    # @favorites = Favorite.where(user_id: @user).all
    @favorites = Favorite.page(params[:page]).reverse_order
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
