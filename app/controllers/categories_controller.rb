class CategoriesController < ApplicationController
  def show
    @ladies=Item.where(category_id:1).order("created_at DESC")
    @goods=Item.where(category_id:params[:id]).order("created_at DESC")
    @category=Category.find(params[:id])
  end
end
