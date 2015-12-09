class User < ActiveRecord::Base
  has_many :orders

  def self.most_items_ordered
    joins(:orders).group('users.id').order('sum(orders.order_items_count) desc')
  end

  def self.most_orders
    order(orders_count: :desc)
  end
end
