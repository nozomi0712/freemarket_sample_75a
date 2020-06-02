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
      render :new_users_address and return
    end
    @user.build_user_address(@user_address.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
  end

  # def edit_user
  #   @user = User.find(params[:id])
  # end
  
  def edit_user_addresses
    @user_address = UserAddress.find(params[:id])
  end
  
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to root_path(@user)
    else
      render :edit
    end
  end

  def update_user_addresses
    @user_address = UserAddress.find(params[:id])
    if @user_address.update(address_params)
      redirect_to root_path(@user_address)
    else
      render :edit_user_addresses
    end
  end


  # protected
  private

  def address_params
    params.require(:user_address).permit(:post, :preficture, :city, :block, :building, :tell_number, :first_name, :first_furigana, :last_name, :last_furigana)
  end


  def user_params
    params.require(:user).permit(:nickname, :email, :birthday, :first_name, :first_furigana, :last_name, :last_furigana, )
  end
  
  # def user_address_params
  #   params.require(:user_address).permit(:post, :preficture, :city, :block, :building, :tell_number)
  # end
end
