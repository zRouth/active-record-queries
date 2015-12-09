class OrderItem < ActiveRecord::Base
  belongs_to :order, counter_cache: true
  belongs_to :item, counter_cache: true
end
