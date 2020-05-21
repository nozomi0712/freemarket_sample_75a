# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
    @user_address = UserAddress.new
  end

  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @user_address = @user.build_user_address
    render :new_users_address
  end

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @user_address = UserAddress.new(address_params)
    unless @user_address.valid?
      flash.now[:alert] = @user_address.errors.full_messages
      render :new_address and return
    end
    @user.build_user_address(@user_address.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
  end

  protected

  def address_params
    params.require(:user_address).permit(:post, :preficture, :city, :block, :building, :tell_number)
  end
end
