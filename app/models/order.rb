class Order < ActiveRecord::Base
  belongs_to :user, counter_cache: true

  has_many :order_items
  has_many :items, through: :order_items

  def self.biggest
    order(order_items_count: :desc)
  end

  def self.users(orders)
    orders.map(&:user).uniq
  end
end
