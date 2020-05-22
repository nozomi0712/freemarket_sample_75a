class UsersController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(items_params)
    if @item.save?
      @redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def items_params
      params.require(:item).permit(:item_name, :explanation, :price, :brand, :condition, :ship_date, :delivery_fee, :user_id)
    end
end
