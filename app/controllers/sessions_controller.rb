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
      session[:email] = @user.email
      redirect_to '/home', :flash => {:success => "Login successful"}
    else
      redirect_to '/home', :flash => {:error => "Login failed, Invalid email/password combination!"}
    end
  end

  def destroy
    session.delete(:username)
    redirect_to '/home', :flash => {:success => "Successfully logged out"}
  end
end