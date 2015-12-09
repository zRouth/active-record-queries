require_relative '../test_helper'

class OrderTest < ActiveSupport::TestCase
  test "that it returns the biggest order" do
    item1 = Item.create!(name: "item1")
    item2 = Item.create!(name: "item2")
    item3 = Item.create!(name: "item3")
    item4 = Item.create!(name: "item4")

    order1 = Order.create!
    order2 = Order.create!
    order3 = Order.create!

    order1.items << [item1, item2, item1]
    order2.items << [item1, item2, item1, item3, item4]
    order3.items << [item1, item2, item1, item4]

    assert_equal [order2, order3, order1], Order.biggest
  end

  test "that it returns the users for this order" do
    order1 = Order.create!
    order2 = Order.create!
    order3 = Order.create!

    user1 = User.create!(name: "zach")
    user2 = User.create!(name: "torta")

    user1.orders << [order1, order2]
    user2.orders << [order3]

    assert_equal [user1, user2], Order.users([order1, order2, order3])
  end

end
