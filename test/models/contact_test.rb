require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  
  
  def setup
    @contact = Contact.new(name: "Example User", email: "user@example.com", message: "test message")
  end

  test "should be valid" do
    assert @contact.valid?
  end
  
  #Checking to see if the contact has a blank name
  test "name should be present" do
    @contact.name = "     "
    assert_not @contact.valid?
  end
  
  #Checking to see if the email is blank
  test "email should be present" do
    @contact.email = "     "
    assert_not @contact.valid?
  end
  
  #Checking to see if the message is blank
  test "message should be present" do
    @contact.message = "     "
    assert_not @contact.valid?
  end
  
  #Checking the length of the name that they can't enter more than 50
  #if it is 51 or above it fails
  test "name should not be too long" do
    @contact.name = "a" * 51
    assert_not @contact.valid?
  end

  #Checking the email cant be more than 255
  test "email should not be too long" do
    @contact.email = "a" * 244 + "@example.com"
    assert_not @contact.valid?
  end
  
  #Checking the message cant be more than 255
  test "message should not be too long" do
    @contact.message= "a" * 256
    assert_not @contact.valid?
  end
  
  test "email validation should accept valid addresses" do
    #The %w is a shorthand way of writing the list in quotes and commas as deliminators
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    
    #Looping through the list of email addresses
    valid_addresses.each do |valid_address|
      #assign the variable from the loop into the @contact.email variable
      @contact.email = valid_address
      #Test if true and display a message if it is not
      assert @contact.valid?, "#{valid_address.inspect} should be valid"
    
    end
    
  end
  
  
  
end
