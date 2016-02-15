class Crisis < User
    has_many :update_crises, :foreign_key => :user_id
    has_many :crisis_updates, through: :update_crises
end