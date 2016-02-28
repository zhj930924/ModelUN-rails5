class CrisisUpdatesController < DirectivesController
    
  def create
    if current_user.crisis_updates.create(type: params[:crisis_updates][:type], 
                                          content: params[:crisis_updates][:content],
                                          title: params[:crisis_updates][:title])
      flash[:success] = "Crisis Updates Created!"
      redirect_to root_url
    else
      flash[:error] = "Fail"
      render 'static_pages/crisis_updates'
    end
  end
    
    private 
        def directive_params
            params.require(:crisis_updates).permit(:content, :picture, :title, :type)
        end
end