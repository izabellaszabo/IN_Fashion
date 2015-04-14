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
      ###### Could redirect to previous viewed products??????????
      redirect_to '/home'

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