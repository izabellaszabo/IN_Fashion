class ContactsController < ApplicationController

  
  def show
    @contact = Contact.find(params[:id])
  end
  
  #Action related for a new contact to the system
  def new
    @contact = Contact.new
  end
  
  def index
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.create(user_params)
    @contact.save
    render 'site/thankyou'
  end

  private

  def user_params
      params.require(:contact).permit(:name, :email, :message)
  end
    
end
