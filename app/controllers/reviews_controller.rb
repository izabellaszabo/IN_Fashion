class ReviewsController < ApplicationController
  
  def new
    @review = Review.new
    @reviewingProduct = Product.find_by(id: params[:productid])
  end
  
  def create 
    productid = params[:productId]
    @user = User.find_by(id: session[:user_id])
    Review.create(:Product_id => productid, :Comment => params[:comments], :Rating => params[:score], 
      :userId => @user.id, :summary => params[:summary], :Date => Time.now.strftime("%Y-%b-%d %H:%M"))
    tempproduct = Product.find_by(id: productid)
    Product.update(productid, :rating => ((tempproduct.rating + params[:score].to_i) / 2))
    redirect_to product_path(:id => productid)
  end
  
end