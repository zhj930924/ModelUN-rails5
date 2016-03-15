class DirectivesController < ApplicationController
  
  def update
    @directive.update_attribute(:title => params[:directive][:title], :content => params[:directive][:content])
  end
  
  def edit
    @directive = Directive.find_by(id: params[:id])
  end
  
  
  def create
    @directive = current_user.directives.build(type: params[:directive][:type], 
                                          content: params[:directive][:content],
                                          title: params[:directive][:title])
    if current_user.directives.create(type: params[:directive][:type], 
                                          content: params[:directive][:content],
                                          title: params[:directive][:title])
      flash[:success] = "Directive created!"
      redirect_to root_url
    else
      flash[:error] = "Fail"
      render 'static_pages/personal_directives'
    end
  end
  
  def destroy
    Directive.find_by(id: params[:id]).destroy
    flash[:success] = "Directive deleted"
    redirect_to root_url
  end
  
  def index
    @filterrific = initialize_filterrific(
      Directive,
      params[:filterrific],
      select_options: {
        with_tag_name: Tag.options_for_select,
        with_user: User.options_for_select,
        with_directive_type: ["PersonalDirective", "CrisisUpdate", "Note", "Resolution"]
      }
    ) or return
    @feed_items = @filterrific.find.page(params[:page])
    
    respond_to do |format|
      format.html
      format.js
    end
    
    rescue ActiveRecord::RecordNotFound => e
      puts "had to reset parameter params: #{ e.message }"
      redirect_to(reset_filterrific_url(format: :html)) and return
    
  end

  private
      def directive_params
          params.require(:resolutions).permit(:content, :picture, :title, :type)
      end

  

    
end