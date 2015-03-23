class CartsController < ApplicationController
  #This the show method that shows what is in the cart for the current order
  def show
    @order_items = current_order.order_items
  end
end
