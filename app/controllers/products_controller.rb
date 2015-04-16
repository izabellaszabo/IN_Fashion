class ProductsController < ApplicationController
  #When the index controller is called it stores all the products in a Products and Orders in Order_Items
  def index
  end
  

  
  def show
    @TempOrder=OrderItem.new
    @product = Product.find(params[:id])
    @recommended = Product.where(subcategory: @product.subcategory).shuffle.take(4)
    @reviews = Review.where(Product_id: params[:id])
  end
  
  def new
    #@item = Item.new
  end
  
  def edit
  end
  
  def men
    #This is the search that does a search with a where clause
    @products = Product.where(Catagory:"men").shuffle
    @category = 'men'
    @subcategory = 'none'
    #This redirects to the view
    render 'products/index'
  end
  
  def women
    #This is the search that does a search with a where clause
    @products = Product.where(Catagory:"women").shuffle
    @category = 'women'
    @subcategory = 'none'
    #This redirects to the view
    render 'products/index'
  end
  
  def sport
    #This is the search that does a search with a where clause
    @products = Product.where("Catagory = 'sport' AND subcategory <> 'equipment'").shuffle
    @category = 'sport'
    @subcategory = 'none'
    #This redirects to the view
    render 'products/index'
  end
  
  def subcategory
    @products = Product.where(subcategory: params[:subcategory]).shuffle
    @subcategory = params[:subcategory]
    @category = params[:breadcrumbsCategory]
    render 'products/index'
  end
  
  def priceRange
    subcat = params[:subcategory]
    if params[:subcategory].eql? "none"
      subcat = "%"
    end  
    
    max = params[:max]
    if max.eql? "none"
      max = "%"
    end
    
    @products = Product.where("price BETWEEN ? AND ? AND Catagory = ? AND subcategory LIKE ?", params[:min], max, params[:breadcrumbsCategory], subcat)
    @subcategory = params[:subcategory]
    @category = params[:breadcrumbsCategory]
    render 'products/index'
  end
  
  def search
    @products = Product.where("title like '%#{params[:searchbar]}%' AND Catagory = '#{params[:breadcrumbsCategory]}' ")
    @category = params[:breadcrumbsCategory]
    @subcategory = params[:subcategory]
    render 'products/index'
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      # Add more permits here
      params.require(:product).permit(:id, :title, :description, :price, :features, :catagory, :subcategory, :color)
      params.require(:review).permit(:id, :Comment, :userId, :Rating, :product_id, :Date)
    end
    
end