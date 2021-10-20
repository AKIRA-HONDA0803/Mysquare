class CategoriesController < ApplicationController
  def search
    @search_category = Square.search(params[:keyword]).page(params[:page]).reverse_order
    @search_categories = Square.search(params[:keyword])
    @keyword = params[:keyword]
    @categories = Category.all
    render "search"
  end

  def search_category
    @value = params[:category_id]
    @search_category = Square.where(category_id: @value).page(params[:page]).reverse_order
    @search_categories = Square.where(category_id: @value)
    @categories = Category.all
    render "search"
  end
end
