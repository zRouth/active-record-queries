class AddOrderItemsCountToItems < ActiveRecord::Migration
  def change
    add_column :items, :order_items_count, :integer, default: 0
  end
end
