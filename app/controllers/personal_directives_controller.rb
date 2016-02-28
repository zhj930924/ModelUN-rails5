class PersonalDirectivesController < DirectivesController
    
  def create
    if current_user.personal_directives.create(type: params[:personal_directive][:type], 
                                          content: params[:personal_directive][:content],
                                          title: params[:personal_directive][:title])
      flash[:success] = "Directive created!"
      redirect_to root_url
    else
      flash[:error] = "Fail"
      render 'static_pages/personal_directives'
    end
  end
  
  def update
    @directive = PersonalDirective.find_by(id: params[:id])
    @directive.update_attributes(:title => params[:personal_directive][:title], :content => params[:personal_directive][:content])
    redirect_to root_url
  end
  
  def edit
    @directive = PersonalDirective.find_by(id: params[:id])
  end
  
    private 
        def directive_params
            params.require(:personal_directive).permit(:content, :picture, :title, :type)
        end
end