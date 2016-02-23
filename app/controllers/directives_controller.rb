class DirectivesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  
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
    redirect_to root_url
  end
  
  private

    def micropost_params
      params.require(:directive).permit(:content, :picture, :title)
    end

    def correct_user
      @directive = current_user.directives.find_by(id: params[:id])
      redirect_to root_url if @directive.nil?
    end
end