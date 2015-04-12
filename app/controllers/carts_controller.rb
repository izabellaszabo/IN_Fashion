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
  
  def submitOrder
    @orderNum = (1_000_000_000_000 + rand(10_000_000_000_000 - 1_000_000_000_000)).to_s.gsub(/(.{5})/, '\\1-')
    #NEEDS TO BE GOTTEN FROM FORM
    @items = 4 
    @name = "Customer Name"
    render 'carts/thankyou'
  end
  
end
