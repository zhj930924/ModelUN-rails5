class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :timeoutable
    
    has_and_belongs_to_many :directives
    attr_accessor :remember_token
    #before_save {self.email = email.downcase}
    #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    #self.inheritance_column = :type
    validates :committee, presence: true, length: { maximum: 50}
    validates :position, presence: true, length: {maximum: 50}
    #validates :email, presence: true, length: { maximum: 255},
    #  format: {with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
    validates :name, presence: true, length: {maximum: 50}
    validates :graduation_class, presence: true
    #validates :password, presence: true, length: { minimum: 6}, allow_nil: true
    validates :type, presence: true
    
    acts_as_messageable
    
    
    
    def mailboxer_name
        self.name
    end

    def mailboxer_email(object)
        self.email
    end
    
    def self.types
        %w(Delegate Crisis)
    end
    
      #Return hash digest of a given string
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    
    
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
    
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
    
    def forget
        update_attribute(:remember_digest, nil)
    end
    
    def crisis_update_feed
        directive_ids = "SELECT directive_id FROM directives_users
                        WHERE type = 'updatecrisis' and user_id = :user_id"
        Directive.where("id IN (#{directive_ids})", user_id: id)
    end
    
    def delegate_personal_directive_feed
        directive_ids = "SELECT directive_id FROM directives_users
                        WHERE type = 'IssueDirective' and user_id = :user_id"
        Directive.where("id IN (#{directive_ids})", user_id: id)
    end
    
    def self.options_for_select
      order('LOWER(name)').map { |e| [e.name, e.id] }
    end
    
# define ActiveRecord scopes for
# :search_query, :sorted_by, :with_country_id, and :with_created_at_gte
    
end
