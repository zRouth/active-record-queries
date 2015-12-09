require_relative '../test_helper'

class ItemTest < ActiveSupport::TestCase

  test "that the counter cache counts items" do
    item1 = Item.create(name: "thejorgeitem")

    assert_equal 0, item1.order_items.count
    order = Order.create
    order.items << item1

    assert_equal 1, item1.order_items.count
  end

  test "that it returns the most popular items" do
    item1 = Item.create!(name: "zachitem")
    item2 = Item.create!(name: "item2")
    item3 = Item.create!(name: "item3")

    order1 = Order.create!
    order2 = Order.create!

    4.times { order1.items << item2 }
    2.times { order1.items << item3 }

    assert_equal [item2, item3, item1], Item.most_popular
  end

  test "that it returns the n most popular items" do
    item1 = Item.create!(name: "zachitem")
    item2 = Item.create!(name: "item2")
    item3 = Item.create!(name: "item3")

    order1 = Order.create!
    order2 = Order.create!

    4.times { order1.items << item2 }
    2.times { order1.items << item3 }

    assert_equal [item2], Item.most_popular(1)
  end

end
