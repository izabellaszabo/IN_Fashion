class SiteController < ApplicationController
  
  
  def about
  end

  def contact
    
  end
  
  #Added by niall to see what happens
  #This needed to be understood further for sure
  def home
    
    if params['id'].to_i != nil
      @tempVar = params['id'].to_i
    else
      #@tempVar = 2
    end
    
    
  end
  
end
