class CategoriesController < ApplicationController
  def index
    @categories = Category.where(ancestry: nil)
  end

  def show
    @category=Category.find(params[:id])
    @goods_list=Item.where(category_id:params[:id]).or(Item.where(category_id:@category.child_ids)).or(Item.where(category_id: @category.indirect_ids)).order("created_at DESC").page(params[:page])
    @goods = @goods_list.where(status: 1)
  end
end
