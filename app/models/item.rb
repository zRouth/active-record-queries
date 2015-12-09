class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items

  def self.most_popular(limit = nil)
    if limit
      order(order_items_count: :desc).limit(limit)
    else
      order(order_items_count: :desc)
    end
  end
end