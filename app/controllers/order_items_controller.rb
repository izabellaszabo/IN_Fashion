class OrderItemsController < ApplicationController
  
  
  def create
    @TempOrder = OrderItem.create(order_parmas)   
    if @TempOrder.save
      
      
      # Handle a successful save and redirect to save page
      redirect_to :back
    else
      render 'site/about'
    end
  end

  
  
  def new
    #@TempOrder = OrderItem.find_by(id: session[:temporder_id])
    #@TempOrder = OrderItem.new
  end
  

  def update
    #@order = current_order
    #@order_item = @order.order_items.find(params[:id])
    #@order_item.update_attributes(order_item_params)
    #@order_items = @order.order_items
    
    #OrderItem.where(:id => params[:orderId]).update_all(:Colour => params[:Quantity])
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end
  
  private
  #These are strong params and are needed
  def order_parmas
    params.require(:order_item).permit(:Quantity, :Total_Price,:OrderID, :Size, :Colour, :Product_id)
    #params.require(:order_item).permit(:Quantity,:Size, :Colour, :Total_Price)
    #params.require(:contact).permit(:name, :email, :message)
  end

end