class ReviewsController < ApplicationController
  
  def new
    @review = Review.new
    @reviewingProduct = Product.find_by(id: params[:productid])
  end
  
  def create 
    productid = params[:productId]
    @user = User.find_by(email: session[:email])
    Review.create(:Product_id => productid, :Comment => params[:comments], :Rating => params[:rating], 
      :userId => @user.id, :summary => params[:summary], :Date => Time.now.strftime("%Y-%b-%d %H:%M"))
      redirect_to product_path(:id => productid)
  end
  
end