class ProductsController < ApplicationController
  #When the index controller is called it stores all the products in a Products and Orders in Order_Items
  def index
    #@products = Product.where(Catagory: "fruit")
    #Some more investigation needs to be done on the new section
    #@order_item = current_order.order_items.new
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @item = Item.new
  end
  
  def edit
  end
  
  def men
    #This is the search that does a search with a where clause
    @products = Product.where(Catagory:"men")
    #This redirects to the view
    render 'products/index'
  end
  
  def women
    #This is the search that does a search with a where clause
    @products = Product.where(Catagory:"women")
    #This redirects to the view
    render 'products/index'
  end
  
  def sport
    #This is the search that does a search with a where clause
    @products = Product.where(Catagory:"sport")
    #This redirects to the view
    render 'products/index'
  end
  
  def accessories
    #This is the search that does a search with a where clause
    @products = Product.where(Catagory:"accessories")
    #This redirects to the view
    render 'products/index'
  end
  
  def subcategory
    @products = Product.where(subcategory: params[:subcategory])
    render 'products/index'
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      # Add more permits here
      params.require(:product).permit(:title, :description, :price, :features, :catagory, :subcategory)
    end
    
end