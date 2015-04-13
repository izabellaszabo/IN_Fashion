class SiteController < ApplicationController
  
  def about
  end

  def contact
  end

  def home
    @fresh = Product.where.not(Catagory: "sport").shuffle.take(12)
  end
  
end
