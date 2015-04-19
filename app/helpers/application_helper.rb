module ApplicationHelper
    
    def User_Var
        @user = User.new
    end
    
    def update_cart_total(var1)
        @CartTotal = @CartTotal.to_i + var1.to_i
    end
    
    def current_order
        
        if !session[:order_id].nil?
          Order.find(session[:order_id])
        else
          Order.new
        end
    end

end
