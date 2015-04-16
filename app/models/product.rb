class Product < ActiveRecord::Base
  has_many :reviews
  has_many :order_items
  
  #THIS MIGHT HAVE TO GO IF WE HAVE NOT SETUP THE COLUMN ACTIVE IN PRODUCT
  #IT WENT :)
  #default_scope {where(active:true)}
end
