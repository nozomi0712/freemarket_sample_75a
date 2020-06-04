class CategoriesController < ApplicationController
  def show
    @category=Category.find(params[:id])
    @goods=Item.where(category_id:params[:id]).or(Item.where(category_id:@category.child_ids)).or(Item.where(category_id: @category.indirect_ids)).order("created_at DESC").page(params[:page]).per(20)
  end
end
