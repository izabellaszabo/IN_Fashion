class AdminController < ApplicationController
  
  def ordersignoff
    @orders = Order.where(approved: false)
    render 'admin/ordersignoff'
  end
  
  def viewmessages
    @unrepliedmessages = Contact.where(replied: false)
    render 'admin/viewmessages'
  end
  
  def viewproducts
    @womens = Product.where("archived = 'false' AND Catagory LIKE 'women'")
    @sport = Product.where("archived = 'false' AND Catagory LIKE 'men'")
    @mens = Product.where("archived = 'false' AND Catagory LIKE 'sport'")
    @currentproducts = Product.where(archived: 'false')
    @cntcurrent = @currentproducts.length
    @archivedProducts = Product.where(archived: 'true')
    @cntarchived = @archivedProducts.length
    render 'admin/viewproducts'
  end
  
  def editproduct
    @product = Product.find_by(id: params[:id])
    render 'admin/editproduct'
  end

end