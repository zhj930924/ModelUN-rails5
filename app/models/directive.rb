class Directive < ActiveRecord::Base
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy
    
    # Nested comments begin
    has_ancestry
    has_comments
    has_many :comments, :as => :commentable, :dependent => :destroy
    # Nested comments end
    
    has_and_belongs_to_many :users
    
    self.inheritance_column = :type
    validates :title, presence: true, length: { maximum: 100}
    validates :content, presence: true, length: { maximum: 1000}
    
    def self.types
        %w(Personal_directive Resolution Crisis_directive)
    end

#   def create
#     @directive = current_users.build(micropost_params)
#     if @micropost.save
#       flash[:success] = "#{self.types} created!"
#       redirect_to root_url
#     else
#       @feed_items = []
#       render 'static_pages/home'
#     end
#   end
  
#   def destroy
#     @micropost.destroy
#     flash[:success] = "Micropost deleted"
#     redirect_to request.referrer || root_url
#   end
  
#   private

#     def micropost_params
#       params.require(:micropost).permit(:content, :picture)
#     end

#     def correct_user
#       @micropost = current_user.microposts.find_by(id: params[:id])
#       redirect_to root_url if @micropost.nil?
#     end
    
end
