class Directive < ActiveRecord::Base
    self.inheritance_column = :type
    validates :title, presence: true, length: { maximum: 100}
    validates :content, presence: true, length: { maximum: 1000}
    
    def self.types
        %w(Personal_directive Resolution Crisis_directive)
    end
    
end
