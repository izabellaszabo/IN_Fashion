class SessionsController < ApplicationController

  def new
  end

  def create
    #user = User.find_by(email: params[:session][:email].downcase)
    
    # finding a user by the name variable username passed from the view
    user = User.find_by(name: params[:session][:name])
    
    #Checking if the user and password are correct
    if user && user.authenticate(params[:session][:password])
      #log_in user
      session[:username]=user.name
      redirect_to user

    #else
      #redirect_to "/"
      # Create an error message.
      #flash[:danger] = 'Invalid email/password combination'
    end
  end

  def destroy
    session.delete(:username)
  end
end