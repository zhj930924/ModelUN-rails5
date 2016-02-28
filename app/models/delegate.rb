class Delegate < User
    has_many :issue_directives, foreign_key: "user_id"
    has_many :personal_directives, through: :issue_directives
    
    has_many :sponsorships, class_name: "ResolutionSponsorship",
                            foreign_key: "user_id"
                            
    has_many :sponsored_resolutions, through: :sponsorships, 
                                    class_name: "Resolution",
                                    source: :resolution
    
    has_many :signatures, class_name: "ResolutionSigning",
                            foreign_key: "user_id"
    has_many :interested_resolutions, through: :signatures, 
                                    class_name: "Resolution",
                                    source: :resolution
    
    has_many :creations, class_name: "ResolutionCreation",
                            foreign_key: "user_id"
    has_many :created_resolutions, through: :creations, 
                                    class_name: "Resolution",
                                    source: :resolution
    
    has_many :manages, foreign_key: "delegate_id"
    has_many :crises, through: :manages
                                
    
    

end