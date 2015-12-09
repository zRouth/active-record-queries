class AddOrderItemsCountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :order_items_count, :integer, default: 0
  end
end
