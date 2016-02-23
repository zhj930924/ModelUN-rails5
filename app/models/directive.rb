class Directive < ActiveRecord::Base
    # before_action :logged_in_user, only: [:create, :destroy]
    # before_action :correct_user, only: :destroy
    default_scope -> { order(created_at: :desc) }
    mount_uploader :picture, PictureUploader
    has_and_belongs_to_many :users
    has_many :comments
    self.inheritance_column = :type
    validates :title, presence: true, length: { maximum: 100}
    validates :content, presence: true, length: { maximum: 1000}

    def self.types
        %w(PersonalDirective Resolution CrisisUpdate)
    end

    def create
        @directive = current_user.directives.build(directive_params)
        if @directive.save
            flash[:success] = "Directive created!"
            redirect_to root_url
        else
            @feed_items = []
            render 'static_pages/home'
        end
    end
    
  def destroy
    @directive.destroy
    flash[:success] = "Directive deleted"
    redirect_to root_url #redirecting to root for now. 
  end
  
#   private

#     def micropost_params
#       params.require(:micropost).permit(:content, :picture)
#     end

#     def correct_user
#       @micropost = current_user.microposts.find_by(id: params[:id])
#       redirect_to root_url if @micropost.nil?
#     end
    
end
