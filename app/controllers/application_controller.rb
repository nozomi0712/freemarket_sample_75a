class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_category
  protected 

  def set_category
    @parents = Category.where(ancestry: nil)
  end

  private
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:email,:birthday,:first_name,:first_furigana,:last_name,:last_furigana])
  end

  def production?
    Rails.env.production?
  end
end
