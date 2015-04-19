module OrderItemsHelper
    
    def calculatetotal
      
        totalval = 0
        finalResutl =0
        
       OrderItem.where(:OrderId => '0').all.each do |oi|
        
        totalval = oi.Total_Price * oi.Quantity
        finalResutl = finalResutl + totalval
      end
      
      
      #session[:totalval] = totalval
      
      return finalResutl
      
    
    end

end
