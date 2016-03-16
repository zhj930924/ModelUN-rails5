class ResolutionsController < DirectivesController
    
  def create
    if current_user.created_resolutions.create(type: params[:resolution][:type], 
                                          content: params[:resolution][:content],
                                          title: params[:resolution][:title])
      flash[:success] = "Resolutions/Committee Directives Created!"
      redirect_to root_url
    else
      flash[:error] = "Fail"
      render 'static_pages/public_resolutions'
    end
  end

  def update
    @directive = Directive.find_by(id: params[:id])
    if @directive.update_attributes(directive_params)
      redirect_to root_url
    else
      flash[:error] = "Wrong"
    end
  end

  private
      def directive_params
          params.require(:resolution).permit(:content, :picture, :title, :type, :editable, :passed, :public)
      end
end