class Comment < ActiveRecord::Base
    belongs_to :directive
    validates :content, presence: true, length: { maximum: 1000}
    has_closure_tree order: 'created_at DESC'
    
    def to_graph_label
        title
    end
end
