class CardsController < ApplicationController
  require "payjp"

  def new
    @card = Card.where(user_id: current_user.id)
    redirect_to credit_card_path(current_user.id) if @card.exists?
  end

  def create
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY] 

    if params["payjp_token"].blank?
      redirect_to action: "new", alert: "クレジットカードを登録できませんでした。"
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params["payjp_token"],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)

      if @card.save
        redirect_to root_path, nortice: "カード情報を登録しました。"
      else
        redirect_to action: "create"
      end
    end
  end

  def show
    @card = Card.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY] 
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @customer_card = customer.cards.retrieve(@card.card_id)
      @exp_month = @customer_card.exp_month.to_s
      @exp_year = @customer_card.exp_year.to_s.slice(2..4)
    end
  end

  def destroy
    @card = Card.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY] 
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete

      if @card.destroy
        redirect_to new_card_path, alert: "カード情報を削除しました。"
      else
        redirect_to card_path(current_user.id), alert: "削除できませんでした。"
      end
    end
  end
end