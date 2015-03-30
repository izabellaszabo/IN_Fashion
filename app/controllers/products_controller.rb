class ProductsController < ApplicationController
  #When the index controller is called it stores all the products in a Products and Orders in Order_Items
  def index
    @products = Product.all
    #Some more investigation needs to be done on the new section
    #@order_item = current_order.order_items.new

  end

  
end