class Contact < ActiveRecord::Base
    
    validates :name, presence: true, length: { maximum: 50 }
    #This is in capitals as it is a constant
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
    validates :message, presence:true , length: { maximum: 255 }
    
    
end
