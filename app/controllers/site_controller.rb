class SiteController < ApplicationController
  
  
  def about
  end

  def contact
  end
  
  #Added by niall to see what happens
  #This needed to be understood further for sure
  def home
    @tempVar = params['id'].to_i
  end
  
end
