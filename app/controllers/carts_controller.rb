class CartsController < ApplicationController
  layout 'book'

  def add
    current_cart.add_item(params[:id])
    session['cart1234'] = current_cart.serialize 
    
    redirect_to root_path, notice: 'Add to Cart'
  end 

  def show
  end 

  def destroy
    session['cart1234'] = nil
    redirect_to root_path, notice: 'Cart is clear now'
  end
end
