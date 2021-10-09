class DeckRecipesController < ApplicationController
  def index
   @deck_recipes = DeckRecipe.where(user_id: current_user.id)
  end

  def create
   @deck_recipe = current_user.deck_recipes.new(deck_recipe_params)
   if @deck_recipe.save
    flash[:notice] = "My squareの設定を完了しました!"
    redirect_to "/deck_squares"
   else
     redirect_to "/deck_squares"
   end
  end
  def update
    @deck_recipe = DeckRecipe.find_by(user_id: current_user.id)
    if @deck_recipe.update(deck_recipe_params)
    flash[:notice] = "My squareの更新を完了しました!"
    redirect_to "/deck_squares"
    end
  end

end

private

  def deck_recipe_params
    params.require(:deck_recipe).permit(:theme, :is_released)
  end