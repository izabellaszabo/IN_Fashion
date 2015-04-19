require 'rubygems'
require 'twilio-ruby'

v1 = ARGV[0]= ARGV[0]

accountSID = 'AC07ac5375765da868ea53c6998f8aaefd'
authToken = 'baca659eafee99a9eb47a9469add3d3f'

@client = Twilio::REST::Client.new accountSID, authToken

from = '+353861800363'


message = @client.account.messages.create(:body => "Jenny please?! I love you <3",
    :to => "+" + v1,     
    :from => "+353861800363")

puts message.sid

puts v1
    
