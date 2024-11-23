class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_cart # Makes this method available to views as well as controllers
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permit additional parameters for sign_up and account_update
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phoneNumber])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phoneNumber])
  end
  private

  def current_cart
    @current_cart ||= Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] ||= @current_cart.id
    @current_cart
  end
end
