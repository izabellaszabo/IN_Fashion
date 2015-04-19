class SiteController < ApplicationController
  
  def about
  end

  def contact
  end

  def home
    @fresh = Product.where("Catagory NOT LIKE '%sport%' AND rating > 4").shuffle.take(12)
  end
  
end
