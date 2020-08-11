class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end
  
  def production?
    Rails.env.production?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_furigana, :first_name_furigana, :birth_day, :family_name_to_deliver, :first_name_to_deliver, :family_name_to_deliver_furigana, :first_name_to_deliver_furigana, :postal_code, :prefecture, :municipalities, :address, :building, :phone_number])
  end
end
