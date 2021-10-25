class DeckRecipesController < ApplicationController
  def index
    @users = User.includes([:deck_recipes]).all
  end

  def create
    @deck_recipe = current_user.deck_recipes.new(deck_recipe_params)
    @deck_squares = DeckSquare.where(user_id: current_user.id)
    return check_deck_square_count if @deck_squares.count < 9
    if @deck_recipe.save
      flash[:notice] = "My squareの設定を完了しました!"
      redirect_to "/deck_squares"
    else
      flash[:notice] = "テーマが空白です。"
      redirect_to "/deck_squares"
    end
  end

  def update
    @deck_recipe = DeckRecipe.find_by(user_id: current_user.id)
    if @deck_recipe.update(deck_recipe_params)
      flash[:notice] = "My squareの更新を完了しました!"
      redirect_to "/deck_squares"
    else
      flash[:notice] = "テーマが空白です。"
      redirect_to "/deck_squares"
    end
  end

  private

  def deck_recipe_params
    params.require(:deck_recipe).permit(:theme, :is_released)
  end

  def check_deck_square_count
    flash[:notice] = "Squareの数が9個未満なので、My squareの設定ができませんでした。"
    redirect_to "/deck_squares"
  end

  def user_params
    params.require(:user).permit(:user_id, :profile_image, :introduction, :name)
  end
end
