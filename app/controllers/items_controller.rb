class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @image = @item.images.new
    @user = User.first
    @address = addressArrey(@user.user_address)
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

  end

  def create
    @item = Item.create(items_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end
  
  def show
    @items = Item.find(params[:id])
    @categories = Category.find(@items.category_id)
    @categories2 = @categories.parent
  end

  def edit
    @item = Item.find(params[:id])
    @image = @item.images
    @user = User.first
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def delete
  end

  def purchase
  end

  private
    def items_params
      params.require(:item).permit(:item_name, :explanation, :price, :brand, :condition, :ship_date, :delivery_fee,:category_id, images_attributes: [:image,:_destroy, :id]).merge(user_id: 1, category_id: 24)
    end

    def addressArrey(user_address)
      user_address_arrey = ["〒" +user_address.post + " ",user_address.preficture,user_address.city]
      return user_address_arrey.join
    end

end
