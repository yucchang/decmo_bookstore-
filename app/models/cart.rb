class Cart
  attr_reader :items 

  def initialize(items =[])
    @items = items
  end

  def add_item(product_id)
    found_item = @items.find { |item| item.product_id == product_id  }

    if found_item
      found_item.increment!
    else
      @items << CartItem.new(product_id) 
    end
  end

  def empty?
    @items.empty? 
  end 

  def total_price 
    @items.reduce(0) { |sum, item| sum + item.total_price } 
    # initial(0), or reduce will start with the 1st element(CartItem)  

    # total = 0 
    # @items.each do |item|
    #   total = total + item.total_price
    # end
    # return total
  end 
  
  def serialize 
    result = @items.map { |item| 
      {"product_id" => item.product_id , "quantity" => item.quantity}
    }

    # result = []
    # @items.each do |item|
    #   {"product_id" => item.product_id , "quantity" => item.quantity } 
    # end

    # items = [
    #   {"product_id" => 1 , "quantity" => 3}, 
    #   {"product_id" => 2 , "quantity" => 2}
    # ]
    
    { "items" => result }
  end 
  
  def self.from_hash(hash = nil)
    if hash && hash["items"]
      items = []
      hash["items"].each do |item|
      # {"product_id" => 1 , "quantity" => 3} 
        items << CartItem.new(item["product_id"], item["quantity"])
    end

      Cart.new(items)
    else 
      Cart.new 
    end
  end
end