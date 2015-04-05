class ApplicationController < ActionController::Base
  include SessionsHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #used for methods that are needed in the View as well to
  helper_method :current_order

  #NEEDS TO BE INVESTIGATED FURTHER ON THIS ONE
  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

end
