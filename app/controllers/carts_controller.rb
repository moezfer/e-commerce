# app/controllers/carts_controller.rb
class CartsController < ApplicationController
    def show
      @cart = current_cart # Define how to retrieve the current user's cart
    end
  end
  