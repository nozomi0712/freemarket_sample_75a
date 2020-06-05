class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) 
    @items = Item.where(user_id: @user.id)
    @selling_items = @items.where(status: true)
    @sold_items = @items.where(status: false)
  end
end
