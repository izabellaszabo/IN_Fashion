class CartsController < ApplicationController
  #This the show method that shows what is in the cart for the current order
  def index
    @order_items = current_order.order_items
  end
  
  def show
    # Will show a specific Cart Item 
  end
  
  def checkout 
    # Stuff Will go here
  end
end
