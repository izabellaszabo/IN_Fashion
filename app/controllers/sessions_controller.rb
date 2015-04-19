class SessionsController < ApplicationController

  def new
  end

  def create
    # finding a user by the name variable username passed from the view
    @user = User.find_by(email: params[:session][:email])
    
    #Checking if the user and password are correct
    if @user && @user.authenticate(params[:session][:password])
      #log_in user
      session[:user_id] = @user.id
      session[:username] = @user.name
<<<<<<< HEAD
      redirect_to '/home', :flash => {:success => "Login successful"}
    else
      redirect_to '/home', :flash => {:error => "Login failed, Invalid email/password combination!"}
=======
      redirect_to '/home'

    #else
      #redirect_to "/"
      # Create an error message.
      #flash[:danger] = 'Invalid email/password combination'
>>>>>>> 929ff14b9bebbe8a21bc3fc5f7f92ab473c0847a
    end
  end

  def destroy
    session.delete(:username)
    redirect_to '/home', :flash => {:success => "Successfully logged out"}
  end
end