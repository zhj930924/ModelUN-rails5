class ResolutionsController < DirectivesController
    
  def create
    if current_user.created_resolutions.create(type: params[:resolution][:type], 
                                          content: params[:resolution][:content],
                                          title: params[:resolution][:title])
      flash[:success] = "Resolutions/Committee Directives Created!"
      redirect_to root_url
    else
      flash[:error] = "Fail"
      render 'static_pages/resolutions'
    end
  end

    private
        def directive_params
            params.require(:resolutions).permit(:content, :picture, :title, :type)
        end
end