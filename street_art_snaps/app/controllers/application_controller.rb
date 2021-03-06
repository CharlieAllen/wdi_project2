class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:username, :first_name, :last_name, :location_id,
        :email, :about_me, :password, :password_confirmation, :user_image)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:username, :first_name, :last_name, :location_id,
        :email, :about_me, :password, :password_confirmation, :current_password, :user_image)
    end
  end

  def after_sign_in_path_for(resource)
    p "Mike"
    user_path(current_user)
  end

end
