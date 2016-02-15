class DirectivesUser < ActiveRecord::Base
    self.inheritance_column = :type

    def self.types
        %w(ResolutionRelationship UpdateCrisis IssueDirective)
    end
end