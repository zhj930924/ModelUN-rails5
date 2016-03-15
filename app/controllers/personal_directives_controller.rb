class PersonalDirectivesController < DirectivesController
  def new
  end

  def create
      current_user.personal_directives.create(type: params[:personal_directive][:type],
                                              content: params[:personal_directive][:content],
                                              title: params[:personal_directive][:title])
      if current_user.personal_directives.include?(type: params[:personal_directive][:type],
                                                   content: params[:personal_directive][:content],
                                                   title: params[:personal_directive][:title])
        flash[:success] = "Directive created!"
        redirect_to request.referrer
      else
        flash[:error] = "Fail"
        redirect_to request.referrer
      end

  end
  
  def update
    if current_user[:type] == "Delegate"
      @directive = PersonalDirective.find_by(id: params[:id])
      @directive.update_attributes(:title => params[:personal_directive][:title], :content => params[:personal_directive][:content])
      redirect_to root_url
    else
      flash[:error] = "Not editable"
      redirect_to request.referrer
    end
  end
  
  def edit
    @directive = PersonalDirective.find_by(id: params[:id])
  end
  private
    def directive_params
      params.require(:personal_directive).permit(:content, :picture, :title, :type)
    end
end