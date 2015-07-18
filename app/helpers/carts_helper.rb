module CartsHelper
    
    def Ordertext
    
        require 'rubygems'
         require 'twilio-ruby'

        accountSID = 'AC07ac5375765da868ea53c6998f8aaefd'
        authToken = 'baca659eafee99a9eb47a9469add3d3f'

        @client = Twilio::REST::Client.new accountSID, authToken

        #from = '+353861800363'
        message = @client.account.messages.create(:body => "Your Order number is 999",
        :to => "+353872374906",     
        :from => "+353861800363")

        puts message.sid
        puts "THIS IS A TEST MESSAGE TO SEE IT ALL WORKS I AM IN THE CARTS HELPER"
<<<<<<< HEAD

 
    
    
=======
   
>>>>>>> f1bcae6919aef3067e8c48c87441cc37993bdc71
    end

end
