class DirectivesTagsController < ApplicationController
  
  def create
    directive = Directive.find_by(id: params[:directive_id])
    tag_id = Tag.find_by(tag: params[:directives_tag][:tag]).id
    if directive.directives_tags.create(directive_id: params[:directive_id], 
                                        tag_id: tag_id)
      flash[:success] = "Link created!"
      redirect_to root_url
    else
      flash[:error] = "Fail"
      render 'static_pages/personal_directives'
    end
  end
  
  def destroy
    DirectivesTag.find_by(id: params)
    flash[:success] = "Directive deleted"
    redirect_to root_url
  end
  
  def index
    @filterrific = initialize_filterrific(
      DirectivesTag,
      params[:filterrific]
    ) or return
    @directivestags = @filterrific.find.page(params[:page])
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private
    def directive_params
      params.require(:directive).permit(:content, :picture, :title, :type)
    end
    
    def correct_user
      @directive = current_user.directives.find_by(id: params[:id])
      redirect_to root_url if @directive.nil?
    end
    
    
end