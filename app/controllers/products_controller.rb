class ProductsController < ApplicationController
  #When the index controller is called it stores all the products in a Products and Orders in Order_Items
  def index
  end
  
  def show
    @product = Product.find(params[:id])
    @recommended = Product.where(subcategory: @product.subcategory).shuffle.take(4)
  end
  
  def new
    @item = Item.new
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
    @products = Product.where("price BETWEEN ? AND ? AND Catagory = ? AND subcategory = ?", params[:min], params[:max], params[:breadcrumbsCategory], params[:subcategory])
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
  
  def addReview
    review = Review.create(:name => "a", :age => 2)
    review.save
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      # Add more permits here
      params.require(:product).permit(:title, :description, :price, :features, :catagory, :subcategory, :color)
    end
    
end