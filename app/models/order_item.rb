class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  
  #Validation. WHEN IS THIS RUN? DIFFERENCE BETWEEN VALIDATES AND VALIDATES?
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