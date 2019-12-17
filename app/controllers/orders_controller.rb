class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = current_user.orders.build(order_params)

    current_cart.items.each do |item|
      @order.order_items.build(book: item.product, 
                               quantity: item.quantity,
                               sell_price: item.product.sell_price) 
    end 

    if @order.save 
      # clear cart
      session['cart1234'] = nil
      redirect_to root_path, notice: 'Order is placed.'
    else
      render 'carts/checkout', notice: 'Error' 
    end
  end

  private 
  def order_params
    params.require(:order).permit(:recipient, :tel, :address, :note)
  end
end
