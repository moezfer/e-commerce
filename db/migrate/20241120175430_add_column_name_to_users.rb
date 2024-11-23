class AddColumnNameToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :phoneNumber, :decimal
  end
end
