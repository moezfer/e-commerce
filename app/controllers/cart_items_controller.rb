class CartItemsController < ApplicationController
    before_action :set_cart
  
    def create
      product = Product.find(params[:product_id])
      item = @cart.cart_items.find_or_initialize_by(product: product)
      item.quantity ||= 0  # Initialize to 0 if quantity is nil
      item.quantity += 1   # Increment the quantity by 1
      item.save
      redirect_to cart_path
    end
  
    def destroy
      item = @cart.cart_items.find(params[:id])
      item.destroy
      redirect_to cart_path
    end
  
    private
  
    def set_cart
      @cart = Cart.find_or_create_by(id: session[:cart_id])
      session[:cart_id] ||= @cart.id
    end
  end
  