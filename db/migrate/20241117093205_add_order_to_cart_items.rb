class AddOrderToCartItems < ActiveRecord::Migration[7.2]
  def change
    add_reference :cart_items, :order, null: false, foreign_key: true
  end
end
