class User < ActiveRecord::Base
    self.inheritance_column = :type
    validates :committee_name, presence: true, length: { maximum: 50}
    validates :email, presence: true, length: { maximum: 255}
    validates :real_name, presence: true, length: {maximum: 50}
    validates :graduation_class, presence: true
    
    def self.types
        %w(Delegate Crisis)
    end
    
end
