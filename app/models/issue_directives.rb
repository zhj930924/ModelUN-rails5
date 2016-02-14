class Issue_directives < Directive
    belongs_to :delegate
    
    # Nested comments begin
    has_ancestry
    has_comments
    has_many :comments, :as => :commentable, :dependent => :destroy
    # Nested comments end
    
end