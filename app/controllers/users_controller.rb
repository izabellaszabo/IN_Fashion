class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    if @viewType == nil
      @viewType = "view"
    end
  end
  
  def create
    billingaddress = params[:bname] + "|" + params[:bstreet] + "|" + params[:bcity] + "|" + params[:bcountry]
    deliveryaddress = params[:dname] + "|" + params[:dstreet] + "|" + params[:dcity] + "|" + params[:dcountry]

    if params[:password1].eql? params[:password2]
      @user = User.new(:name => params[:firstname], :lastname => params[:lastname], 
        :email => params[:username], :password => params[:password1], :password_confirmation => params[:password2],
        :billing_address => billingaddress, :delivery_address => deliveryaddress)
      if @user.save()
        @user = User.find_by(email: params[:username])
        session[:user_id] = @user.id
        session[:username] = @user.name
        redirect_to "/account"
      else
        redirect_to new_user_path, :flash => {:error => "Could not save user, please make sure you have a valid email
          address and that password is longer than 5 characters!"}
      end 
    else
      redirect_to new_user_path, :flash => {:error => "Passwords do not match!"}
    end

  end
  
  def change_details
    @viewType = "edit" + params[:detailSection]
    render 'users/show'
  end
  
  def updateAccount
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:passwordold])
      
      if (params[:password1].eql? params[:password2]) && !(params[:password1].eql? "")
         @user.update_attributes(:name => params[:firstname], :lastname => params[:lastname], 
              :password => params[:password1], :password_confirmation => params[:password2])
        render 'users/show', :flash => {:success => "Profile Updated"}
        
      elsif (params[:password1].eql? "") && (params[:password2].eql? "")
        @user.update_attributes(:name => params[:firstname], :lastname => params[:lastname])
        redirect_to '/users/show', :flash => {:success => "Profile Updated!"}, :id => @user.id
      else 
        redirect_to '/users/show', :flash => {:error => "Passwords do not match!"}, :id => @user.id
      end
    else 
      redirect_to '/users/show', :flash => {:error => "Update Failed. Original Password is incorrect!"}, :id => @user.id
    end
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
  def user_params
      params.require(:user).permit(:userId, :lastname, :name, :email, :password, :password_confirmation, :billing_address, :delivery_address)
  end

end
