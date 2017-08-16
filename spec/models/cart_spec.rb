require 'rails_helper'

RSpec.describe Cart, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # it "do something" 這這樣寫也可以作為一種給自己的提醒事項

  describe "購物車基本功能" do
    #* 可以新增商品到購物車裡，然後購物車裡就有東西了
    #* 如果加了相同種類的商品，購買項目(CartItem)並不會增加，但數量會改變。
    #* 商品可以放到購物車裡，也可以再拿出來
    #* 可以計算整個購物車的總消費金額
  end

  describe "購物車進階功能" do
    #* 因為購物車將以 Session 方式儲存，所以：
      #* 可以將購物車內容轉換成 Hash
      #* 也可以把 Hash 還原成購物車的內容
  end
end
