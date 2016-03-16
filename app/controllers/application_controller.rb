class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_locale
  # include SessionsHelper
  around_filter :with_timezone
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_filter :authenticate_user!
  # skip_before_filer :authenticate_user!
  helper_method :mailbox, :conversation
  private
    
  def mailbox
    @mailbox ||= current_user.mailbox
  end
  
  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end
  
  def with_timezone
    timezone = Time.find_zone(cookies[:timezone])
    Time.use_zone(timezone) { yield }
  end

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up){ |u| u.permit(:name, :email, :password, 
    :type, :password_confirmation, :committee, :position, :graduation_class)}
    devise_parameter_sanitizer.for(:account_update){ |u| u.permit(:name, :email,
    :password, :type, :password_confirmation, :committee, :position,
    :graduation_class, :current_password)}
    
  end
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def after_sign_out_path_for(users)
    root_path
  end
  
end
