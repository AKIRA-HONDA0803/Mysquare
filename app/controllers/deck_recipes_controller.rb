class DeckRecipesController < ApplicationController
  def index
    @deck_recipes = DeckRecipe.where(user_id: current_user.id)
  end

  def create
    @deck_recipe = current_user.deck_recipes.new(deck_recipe_params)
   if @deck_recipe.save
    flash[:notice] = "#{@deck_recipe.square.title}をデッキに追加しました!"
    redirect_to "/deck_recipes"
   end
  end

  private
  def deck_recipe_params
   params.require(:deck_recipe).permit(:square_id)
  end
end
