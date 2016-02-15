class Delegate < User
    has_many :issue_directives, foreign_key: "user_id"
    has_many :personal_directives, through: :issue_directives
    
    has_many :sponsorships, class_name: "ResolutionRelationship",
                            foreign_key: "user_id",
                            dependent: :destroy
    has_many :sponsored_resolutions, through: :sponsorship, 
                                    class_name: "Resolution",
                                    source: :resolution
    
    has_many :signatures, class_name: "ResolutionRelationship",
                            foreign_key: "user_id",
                            dependent: :destroy
    has_many :interested_resolutions, through: :signatures, 
                                    class_name: "Resolution",
                                    source: :resolution
                                
    
    

end