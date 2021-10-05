class DeckRecipesController < ApplicationController
  def index
    @deck_recipes = DeckRecipe.where(user_id: current_user.id)
  end

  def create
   @deck_recipe = current_user.deck_recipes.new(deck_recipe_params)
   if @deck_recipe.save
    flash[:notice] = "#{@deck_recipe.square.title}をデッキに追加しました!"
    redirect_to "/deck_recipes"
   else
     flash[:notice] = "デッキのSquareはすでに9つ存在します。"
     redirect_to "/deck_recipes"
   end
  end

  def destroy
   @deck_recipe = DeckRecipe.find(params[:id])
   @deck_recipe.destroy
   redirect_to deck_recipes_path
  end

  def destroy_all
    deck_recipes = DeckRecipe.where(user_id: current_user.id)
    deck_recipes.destroy_all
    flash[:notice] = "デッキのを空にしました"
    redirect_to deck_recipes_path
  end

  private
  def deck_recipe_params
   params.require(:deck_recipe).permit(:square_id)
  end
end
