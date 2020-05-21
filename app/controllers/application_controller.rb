class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  # CSRF対策のため記載↓↓
  # protect_from_forgery with: :null_session

  
  
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
