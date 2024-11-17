
    class OrdersController < ApplicationController
        def new
          @cart = current_cart
          @order = Order.new
          @cart_items = @cart.cart_items
        end
      
        def create
          @cart = current_cart
          @order = Order.new(order_params)
          @order.total_price = @cart.cart_items.sum { |item| item.quantity * item.product.price }
          if @order.save
            # Associate the cart items with the order
            @cart.cart_items.update_all(order_id: @order.id)
      
            # Clear the cart (optional)
            @cart.cart_items.destroy_all
      
            redirect_to order_path(@order), notice: 'Order placed successfully!'
          else
            render :new, alert: 'Failed to place the order.'
          end
        end
      
        def show
          @order = Order.find(params[:id])
          @cart_items = @order.cart_items
        end
      
        private
      
        def order_params
          params.require(:order).permit(:status)
        end
      end
      

