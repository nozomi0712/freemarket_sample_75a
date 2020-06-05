class ItemsController < ApplicationController
  def index
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

  # 購入確認処理
  def buy
    @item = Item.find(params[:id])
    @images = @item.image.all

    if user_signed_in?
      @user = current_user

      if @user.card.present?
        Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY] 
        @card = Card.find_by(user_id: @user.id)
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @customer_card = customer.cards.retrieve(@card.card_id)
        @exp_month = @customer_card.exp_month.to_s
        @exp_year = @customer_card.exp_year.to_s.slice(2,3)
      end
    else
      redirect_to root_path, alert: "ログインしてください"
    end
  end

  # 購入処理
  def pay
    @item = Item.find(params[:id])
    @images = @item.image.all

    if @item.status == 2
      redirect_to item_path(@item.id), alert: "売り切れています。"
    else
      @item.with_lock do
        if current_user.card.present?
          @card = Card.find_by(user_id: @user.id)
          Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY] 
          charge = Payjp::Charge.create(
          amount: @item.price,
          customer: Payjp::Customer.retrieve(@card.customer_id),
          currency: 'jpy'
          )
        else
          Payjp::charge.create(
          amount: @item.price,
          card: params['payjp-token'],
          currency: 'jpy'
          )
        end 

      @trade = Trade.create(create_params)
      item-status = Item.update(status: 2)
      end
    end
  end

  private
    def items_params
      params.require(:item).permit(:item_name, :explanation, :price, :brand, :condition, :ship_date, :delivery_fee,images_attributes: [:image]).merge(user_id: 1)
    end

    def addressArrey(user_address)
      user_address_arrey = ["〒" +user_address.post + " ",user_address.preficture,user_address.city]
      return user_address_arrey.join
    end

    def create_params
      params.require(:trade).merge(item_id: @item.id, buyer_id: @current_user.id, seller_id: @item.user_id)
    end

end
