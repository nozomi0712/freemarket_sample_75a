class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @image = @item.images.new
    @user = User.first
    # @addresses = @user.user_address
    # @address = addressArrey(@user)
  end

  def create
    @item = Item.create(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @items = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  def delete
  end

  def purchase
  end

  private
    def items_params
      params.require(:item).permit(:item_name, :explanation, :price, :brand, :condition, :ship_date, :delivery_fee,images_attributes: [:image]).merge(user_id: 1)
    end

    def addressArrey(user)
      user.user_addresses.each do |user_address|
        user_address_arrey = ["〒" +user_address.post + " ",user_address.preficture,user_address.city]
        return user_address_arrey.join
      end
    end
end
