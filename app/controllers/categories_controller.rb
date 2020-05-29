class CategoriesController < ApplicationController
  def show
    @category=Category.find(params[:id])
    @goods=Item.where(category_id:params[:id]).order("created_at DESC").page(params[:page]).per(5)
  end
end
