require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it "每個 CartItem 都可以計算自己的小計金額" do
    p1 = FactoryGirl.create(:product, price: 10)
    p2 = FactoryGirl.create(:product, price: 100)
    # p1 = Product.create(title: "Ruby", price: 10)
    # p2 = Product.create(title: "PHP", price: 100)

    cart = Cart.new
    3.times { cart.add_item(p1.id) }
    5.times { cart.add_item(p2.id) }
    2.times { cart.add_item(p1.id) }

    expect(cart.items.first.total_price).to eq 50
    expect(cart.items.last.total_price).to eq 500
  end
end
