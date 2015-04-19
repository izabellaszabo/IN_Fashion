class AdminController < ApplicationController
  
  def ordersignoff
    @orders = Order.where(approved: false)
    render 'admin/ordersignoff'
  end
  
  def viewmessages
    @unreadmessages = Contact.where(readmsg: false)
    @unrepliedmessages = Contact.where(replied: false)
    render 'admin/viewmessages'
  end
  
  def viewproducts
    @currentProducts = Product.where(archived: false)
    @archivedproducts = Product.where(archived: true)
    render 'admin/viewproducts
    '
  end
  
  def editproducts
    @product = Product.find_by(id: params[:id])
    render 'admin/editproducts'
  end
  
end