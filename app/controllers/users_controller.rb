class UsersController < ApplicationController
  def new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      # Handle a successful save and redirect to save page
      redirect_to "/"
    else
      render 'site/about'
    end
  end
  
  #Everyting below here is private unless public keyword used
  private
  
  #Setting up Strong parameters as this is needed
  def user_params
      params.require(:user).permit(:name, :email, :password, :billing_address, :delivery_address)
  end

end
