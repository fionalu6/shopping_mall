class Cart
  attr_reader :items

  def initialize(items = []) # 先給一個空陣列作為預設值，讓前面沒帶參數的不會壞掉
    @items = items
  end

  def add_item(product_id)
    found_item = items.find{ |item|
      item.product_id == product_id
    }
    if found_item
      found_item.increment
    else
      items << CartItem.new(product_id)
    end
    # @items << product_id
  end

  def empty?
    items.empty?
  end

  def total_price
    items.reduce(0) { |sum, item|
      sum + item.total_price
    }
  end

  def serialize
    list = items.map { |item|
      {"product_id" => item.product_id,
       "quantity" => item.quantity}
    }

    # list = []
    # @items.each do |item|
    #   list << {"product_id" => item.product_id,
    #            "quantity" => item.quantity}
    # end
    { "items" => list }
  end

  def self.from_hash(hash)
    if hash.nil? or hash["items"].nil?
      # 如果 hash 是空的或者沒有 items 這東西在裡面就給你一台全新的車
      new # 因為在 Cart 類別中，可簡略 Cart.new 為 new
    else
      new hash["items"].map { |item|
        CartItem.new(item["product_id"], item["quantity"])
      } # 把 Hash 的結果作為 new 的參數，小括號省略的寫法
      # a = []
      # hash["items"].each do |item|
      # a  << CartItem.new(item["product_id"], item["quantity"])
    end
  end
end
