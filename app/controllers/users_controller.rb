class UsersController < ApplicationController
  def show
   @user = User.find(params[:id])
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
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
