class AddLastPurchaseDateToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :last_purchase_date, :datetime
  end
end
