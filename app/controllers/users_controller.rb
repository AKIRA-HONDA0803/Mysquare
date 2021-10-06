class UsersController < ApplicationController
  def show
   @user = User.find(params[:id])
   @deck_recipes = DeckRecipe.where(user_id: @user,is_released: "true")
   # ステータスが公開中のデッキレシピのみを公開。
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   if@user.update(user_params)
    redirect_to user_path(@user)
   else
    render :edit
   end
  end

  def favorites
    @user = User.find_by(id: params[:id])
    @favorites = Favorite.where(user_id: @user).all
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :is_released)
  end
end
