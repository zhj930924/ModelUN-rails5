class Crisis_update < Directive
    belongs_to :crisis
    
    # Nested comments begin
    has_ancestry
    has_comments
    has_many :comments, :as => :commentable, :dependent => :destroy
    # Nested comments end
end