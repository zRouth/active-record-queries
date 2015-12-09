require_relative '../test_helper'

class UserTest < ActiveSupport::TestCase
  test "that it returns the user who has ordered the most items" do
    item1 = Item.create!(name: "item1")
    item2 = Item.create!(name: "item2")
    item3 = Item.create!(name: "item3")
    item4 = Item.create!(name: "item4")

    user = User.create(name: "jorge")
    user2 = User.create(name: "torta")
    user3 = User.create(name: "zach")

    order1 = Order.create!
    order2 = Order.create!
    order3 = Order.create!

    order1.items << [item1, item2, item1]
    order2.items << [item1, item2, item1, item3, item4]
    order3.items << [item1, item2, item1, item4]

    user.orders << order1
    user2.orders << order2
    user3.orders << order3

    assert_equal [user2, user3, user], User.most_items_ordered
  end

  test "that it returns the user who has placed the most number of orders" do
    order1 = Order.create
    order2 = Order.create
    order3 = Order.create
    order4 = Order.create

    order5 = Order.create
    order6 = Order.create

    zach = User.create(name: "zach")
    steve = User.create(name: "steve")

    steve.orders << [order1, order2, order3, order4]
    zach.orders << [order5, order6]

    assert_equal [steve, zach], User.most_orders
  end
end
