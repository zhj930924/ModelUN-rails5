class Resolution < Directive
    has_many :sponsorships, class_name: "ResolutionRelationship",
                            foreign_key: "directive_id",
                            dependent: :destroy
    has_many :sponsors, through: :sponsorships, 
                        class_name: "Delegate",
                        source: :delegate
                        
    
    has_many :signatures, class_name: "ResolutionRelationship",
                            foreign_key: "directive_id",
                            dependent: :destroy
    has_many :signers, through: :signatures, 
                        class_name: "Delegate",
                        source: :delegate
                        
end
