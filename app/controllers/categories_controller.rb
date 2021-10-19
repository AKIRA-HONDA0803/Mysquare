class CategoriesController < ApplicationController
  def search
    @search_category = Square.search(params[:keyword]).page(params[:page]).reverse_order
    @keyword = params[:keyword]
    @categories = Category.all
    render "search"
  end

  def search_category
    @value = params[:category_id]
    @search_category = Square.where(category_id: @value).page(params[:page]).reverse_order
    @categories = Category.all
    render "search"
  end
end
