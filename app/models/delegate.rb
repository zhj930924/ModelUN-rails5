class Delegate < User
    has_many :personal_directives
    has_and_belongs_to_many :delegates

end