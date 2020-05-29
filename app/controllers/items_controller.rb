class ItemsController < ApplicationController
  def index
    @ladies=Item.where(category_id:1).order("created_at DESC").limit(5)
    @mens=Item.where(category_id:2).order("created_at DESC").limit(5)
    @babykids=Item.where(category_id:3).order("created_at DESC").limit(5)
    @interias=Item.where(category_id:4).order("created_at DESC").limit(5)
    @books=Item.where(category_id:5).order("created_at DESC").limit(5)
    @toys=Item.where(category_id:6).order("created_at DESC").limit(5)
    @perfumes=Item.where(category_id:7).order("created_at DESC").limit(5)
    @cameras=Item.where(category_id:8).order("created_at DESC").limit(5)
    @sports=Item.where(category_id:9).order("created_at DESC").limit(5)
    @handmades=Item.where(category_id:10).order("created_at DESC").limit(5)
    @tickets=Item.where(category_id:11).order("created_at DESC").limit(5)
    @automobiles=Item.where(category_id:12).order("created_at DESC").limit(5)
    @others=Item.where(category_id:13).order("created_at DESC").limit(5)
  end

  def new
    @item = Item.new
    @image = @item.images.new
    @user = User.first
    @address = addressArrey(@user.user_address)
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
    @categories = Category.find(@items.category_id)
    @categories2 = @categories.parent
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

    def addressArrey(user_address)
      user_address_arrey = ["〒" +user_address.post + " ",user_address.preficture,user_address.city]
      return user_address_arrey.join
    end

end
