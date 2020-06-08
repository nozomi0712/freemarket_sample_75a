class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren, :purchase, :pay]
  before_action :check_login_user, except: [:index, :show, :purchase, :pay]
  before_action :check_correct_user, only: [:edit, :update, :destroy]
  before_action :set_caegory_for_new_create, only: [:new, :create]
  before_action :set_user_addresses, only: [:new, :create,:edit, :update, :destroy]
  before_action :set_category_for_edit_update, only: [:edit, :update]
  
  def index
    @categories=Category.where(ancestry: nil)
  end

  def new
    @item = Item.new
    @images = @item.images.build
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  def create
    @item = Item.create(items_params)
    if @item.save
      flash[:notice] = "出品しました"
      redirect_to root_path
    else
      flash.now[:alert] = "内容を確認してください"
      @images = @item.images.build
      render new_item_path
    end
  end
  
  def show
    @categories = Category.find(@item.category_id)
    @categories2 = @categories.parent
    
  end
  
  def edit
    @images = @item.images
  end
  
  def update
    if @item.update(items_params)
      flash[:notice] = "内容を更新しました"
      redirect_to root_path
    else
      flash.now[:alert] = "編集内容を確認してください"
      @images = @item.images
      render :edit
    end
  end

  def destroy
    if @item.destroy
      flash[:notice] = "出品を取り消しました"
      redirect_to root_path
    else
      flash[:alert] = "取り消しに失敗しました"
      render :edit
    end
  end

  def purchase

    unless user_signed_in?
      redirect_to new_user_session_path
    else
      @item = Item.find(params[:id])
      @trade = Trade.new
      @card = Card.find_by(user_id: current_user.id)

      unless @card.blank?
        Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @customer_card = customer.cards.retrieve(@card.card_id)
        @exp_month = @customer_card.exp_month.to_s
        @exp_year = @customer_card.exp_year.to_s.slice(2..4)
      end
    end
  end

  def pay
    @item = Item.find(params[:id])
    @image = @item.images.first
    @item.update(status: false)
    @user = current_user
    Trade.create(create_params)

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
    end
  end

  private
    def items_params
      params.require(:item).permit(:item_name, :explanation, :price, :brand_id, :condition_id, :ship_date_id, :delivery_fee_id,:category_id,:user_address_id,images_attributes: [:image,:_destroy, :id]).merge(user_id: current_user.id )
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def set_caegory_for_new_create
      @category_parent_array = ["---"] + Category.where(ancestry: nil).first(13).pluck(:name)
    end
    
    def set_user_addresses
      @user_address = UserAddress.where(user_id: current_user.id)
      @addresses = [] 
      @user_address.each do |user_address|
        address = ["〒#{user_address.post}" + "  /  " + "#{user_address.preficture}" + "#{user_address.city}" + "#{user_address.block}" + "#{user_address.building}", "#{user_address.id}"]
        @addresses << address
      end
    end

    def set_category_for_edit_update
      @category_grandchildren = Category.find(@item[:category_id])
      @category_children = @category_grandchildren.parent
      @category_parent_array =  ["#{@category_children.parent.name}"] + Category.where(ancestry: nil).first(13).pluck(:name)
      @current_item_category = "#{@category_children.parent.name}/#{@category_children.name}/#{@category_grandchildren.name}"
    end

    def check_login_user
      unless current_user
        flash[:alert] = "アクセス権限がありません"
        redirect_to root_path
      end
    end

    def check_correct_user
      unless @user = current_user
        flash[:alert] = "アクセス権限がありません"
        redirect_to root_path
      end
    end

    def create_params
      params.require(:trade).permit(:item_id, :buyer_id, :seller_id)
    end
end
