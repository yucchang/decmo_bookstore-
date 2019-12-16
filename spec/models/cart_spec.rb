require 'rails_helper'
 
RSpec.describe Cart, type: :model do
  context "基本功能" do 
    it "把商品丟到購物車，購物車就有東西" do 
      cart = Cart.new 
      cart.add_item(1)
      expect(cart.empty?).to be false 
    end
  end
end
