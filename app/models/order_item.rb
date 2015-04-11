class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  
  #Validation. WHEN IS THIS RUN? See comment below, ask Colm
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present
  
  before_save :finalize
  
  #THIS MIGHT BE REMOVED AS IT IS A CHECK FOR A PRICE CHANGE
  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

private
  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end
  
#MAY NOT BE NEEDED AS THIS IS SETS THE VALUES IF THEIR ARE ANY CHANGES
  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
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