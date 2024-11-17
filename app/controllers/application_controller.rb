class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_cart # Makes this method available to views as well as controllers

  private

  def current_cart
    @current_cart ||= Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] ||= @current_cart.id
    @current_cart
  end
end
