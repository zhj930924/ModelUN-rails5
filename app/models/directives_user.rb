class DirectivesUser < ActiveRecord::Base
    self.inheritance_column = :type
    
    def self.types
        %w(Sponsor_resolution Sign_resolution Update_crisis Issue_directives)
    end
end