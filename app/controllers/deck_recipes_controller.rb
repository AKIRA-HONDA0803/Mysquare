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
end

private

  def square_params
    params.require(:square).permit(:image, :title, :description, :user_id, :square_id, :category_id)
  end