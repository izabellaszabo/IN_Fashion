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
  
  def edit
  end
  
  def update
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save()
      @contact.update_attributes(:readmsg => 'false', :replied => 'false')
      render 'site/thankyou'
    else
      redirect_to new_contact_path, :flash => {:error => "Message could not be sent, please try again"}
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
    
    def message_params
      params.require(:contact).permit(:messageId)
    end
  
end
