class User < ActiveRecord::Base
    has_many :reviews
    
    before_create { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    validates :lastname, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX },
        uniqueness: { case_sensitive: false }
    
    has_secure_password
    
    validates :password, length: { minimum: 5 }, allow_blank: true
    validates :billing_address, length: {minimum: 1}, allow_blank: true
    validates :delivery_address, length: {minimum: 1}, allow_blank: true
    
end
