class UsersController < ApplicationController
  def new
  end
  
  def show
    if @viewType == nil
      @viewType = "view"
    end
  end
  
  def create
    @user = User.new(user_params)    
    if @user.save
      # Handle a successful save and redirect to save page
      
      redirect_to "/"
    else
      render 'site/about'
    end
  end
  
  def change_details
    @viewType = "edit" + params[:detailSection]
    render 'users/show'
  end
  
  def updateAccount
    if params[:password1].eql? params[:password2]
      User.where(:id => params[:userId]).update_all(:name => params[:firstname], :lastname => params[:lastname], :password_digest => params[:password1])
    end
    render 'users/show'
  end
  
  def updateBilling
    newBillingAddress = params[:name] + "|" + params[:street] + "|" + params[:city] + "|" + params[:country]
    User.where(:id => params[:userId]).update_all(:billing_address => newBillingAddress)
    render 'users/show'
  end
  
  def updateDelivery
    newDeliveryAddress = params[:name] + "|" + params[:street] + "|" + params[:city] + "|" + params[:country]
    User.where(:id => params[:userId]).update_all(:delivery_address => newDeliveryAddress)
    render 'users/show'
  end
  
  #Everyting below here is private unless public keyword used
  private
  
  #Setting up Strong parameters as this is needed
  def user_params1
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :billing_address, :delivery_address)
  end
  
  def user_params
      params.require(:user).permit(:name,:email, :password, :password_confirmation)
  end

end
