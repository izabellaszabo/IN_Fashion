class ProductsController < ApplicationController
  #When the index controller is called it stores all the products in a Products and Orders in Order_Items
  def index
    #@products = Product.where(Catagory: "fruit")
    #Some more investigation needs to be done on the new section
    #@order_item = current_order.order_items.new

  end
  
  def men
    #This is the search that does a search with a where clause
    @products = Product.where(Catagory:"sheep")
    #This redirects to the view
    render 'products/index'
  end
  
  def women
    #This is the search that does a search with a where clause
    @products = Product.where(Catagory:"fruit")
    #This redirects to the view
    render 'products/index'
  end

  
end