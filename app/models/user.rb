class User < ActiveRecord::Base
    before_save {self.email = email.downcase}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    self.inheritance_column = :type
    validates :committee, presence: true, length: { maximum: 50}
    validates :position, presence: true, length: {maximum: 50}
    validates :email, presence: true, length: { maximum: 255},
      format: {with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
    validates :real_name, presence: true, length: {maximum: 50}
    validates :graduation_class, presence: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6}, allow_nil: true
      
    
    def self.types
        %w(Delegate Crisis)
    end
    
end
