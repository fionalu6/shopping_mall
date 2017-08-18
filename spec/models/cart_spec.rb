require 'rails_helper'

RSpec.describe Cart, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # it "do something" 這這樣寫也可以作為一種給自己的提醒事項

  # before(:each) { @cart = Cart.new} # 每執行一段之前先做一次
  # before(:all) do
  let(:cart){ Cart.new } # 把重複的事情拉出來做一次

  describe "購物車基本功能" do
    it "可以新增商品到購物車裡，然後購物車裡就有東西了" do

      cart.add_item(1)
      # expect(cart.empty?).to be false
      expect(cart).not_to be_empty
    end

    it "加了相同種類的商品，CartItem不會增加，但數量會改變" do

      3.times { cart.add_item 1 }
      5.times { cart.add_item 2 }
      expect(cart.items.count).to be 2
      expect(cart.items.first.quantity).to be 3
      expect(cart.items.last.quantity).to be 5
    end

    it "商品可以放到購物車裡，也可以再拿出來" do
      p1 = Product.create # <== ActiveRecord, ORM


      cart.add_item(p1.id)

      expect(cart.items.first.product).to be_a Product
      expect(cart.items.first.product_id).to be p1.id
    end

    it "可以計算整個購物車的總消費金額" do
      p1 = Product.create(title: "Ruby", price: 10)
      p2 = Product.create(title: "PHP", price: 100)


      3.times { cart.add_item(p1.id) }
      5.times { cart.add_item(p2.id) }
      2.times { cart.add_item(p1.id) }

      expect(cart.total_price).to eq 550
    end
  end


  describe "購物車進階功能" do
    it "可以將購物車內容轉換成 Hash" do
      3.times { cart.add_item(2) }
      5.times { cart.add_item(4) }

      expect(cart.serialize).to eq cart_hash
    end

    it "也可以把 Hash 還原成購物車的內容" do
      cart = Cart.from_hash(cart_hash)
      expect(cart.items.count).to be 2
      expect(cart.items.first.quantity).to be 3
      expect(cart.items.last.product_id).to be 4
    end
  end

  private
  def cart_hash
     {
      "items" => [
        {"product_id" => 2, "quantity" => 3},
        {"product_id" => 4, "quantity" => 5},
      ]
    }
  end
end
