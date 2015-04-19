class Order < ActiveRecord::Base
  #Assocition to other tables
  belongs_to :order_status
  has_many :order_items
  
  # Private Method that is run to set the status to 1.
  before_create :set_order_status
  # Seting the subtotal if anychanges happen in the prices. 
  before_save :update_subtotal

  # This method goes through Order Item, Checks if it is valid and then sums total
  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
  
  
  
private
  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
