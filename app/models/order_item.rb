class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  validates :Quantity, presence:true , length: { maximum: 50 }

end

=begin

http://stackoverflow.com/questions/18140898/whats-the-difference-between-validate-and-validates
validates This method is a shortcut to all default validators 
and any custom validator classes ending in ‘Validator’. Note 
that Rails default validators can be overridden inside specific 
classes by creating custom validator classes in their place such as PresenceValidator.

validates :title, :body, :presence => true
validate, Adds a validation method or block to the class. 

This is useful when overriding the validate instance method becomes too unwieldy 
and you’re looking for more descriptive declaration of your validations.

=end