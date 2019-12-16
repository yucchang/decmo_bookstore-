require 'rails_helper'
 
RSpec.describe Cart, type: :model do
  context "基本功能" do 
    it "把商品丟到購物車，購物車就有東西" do 
      cart = Cart.new 
      cart.add_item(1)
      expect(cart.empty?).to be false 
    end

    it "加了相同商品，項目不會增加，商品數量會改變" do
      cart = Cart.new 
      
      3.times { cart.add_item(1) }
      2.times { cart.add_item(2) }
      
      expect(cart.items.count).to be 2
      expect(cart.items.first.quantity).to be 3
    end

    it "商品可以放到購物車，可以再拿出來" do
      cart = Cart.new 

      p1 = Publisher.create(name: 'kk store')
      c1 = Category.create(name: 'ruby book')
      b1 = Book.create(
        title: 'hello',
        isbn: 'aaa',
        isbn13: 'bbb',
        list_price: 100,
        sell_price: 122, 
        page_num: 100,
        publisher: p1, 
        category: c1
        )

        cart.add_item(b1.id)
        expect(cart.items.first.product).to be_a Book
    end
  end
end
