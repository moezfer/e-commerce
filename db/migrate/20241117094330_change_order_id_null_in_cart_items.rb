class ChangeOrderIdNullInCartItems < ActiveRecord::Migration[7.2]
  def change
    change_column_null :cart_items, :order_id, true
  end
end
