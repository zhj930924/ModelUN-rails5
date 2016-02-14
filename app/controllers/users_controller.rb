class UsersController < ApplicationController
  
#   def destroy
#     User.find(params[:id]).destroy
#     flash[:success] = "User deleted"
#     redirect_to users_url
#   end
  
#   def index
#     @users = User.paginate(page: params[:page])
#   end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      # @user.send_activation_email
      flash[:info] = "Welcome to the sample application"
      redirect_to @user
    else
      render 'new'
    end
  end
  
#   def edit
#   end
  
  def show
    @user = User.find(params[:id])
    # @microposts = @user.microposts.paginate(page: params[:page])
  end
  
#   def update
#     if @user.update_attributes(user_params)
#       flash[:success] = "Profile updated"
#       redirect_to @user
#     else
#       render 'edit'
#     end
#   end

  private
    def user_params
      params.require(:user).permit(:real_name, :email, :password, :password_confirmation, :committee, :position, :graduation_class)
    end
    
#     # Before filters
    
    
#     def correct_user
#       @user = User.find(params[:id])
#       redirect_to(root_url) unless current_user?(@user)
#     end
    
#     def admin_user
#       redirect_to(root_url) unless current_user.admin?
#     end
# end

  
end
