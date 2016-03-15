class CrisisUpdatesController < DirectivesController
    
  def create
    if current_user.crisis_updates.create(type: params[:crisis_update][:type],
                                          content: params[:crisis_update][:content],
                                          title: params[:crisis_update][:title])
      flash[:success] = "Crisis Updates Created!"
      redirect_to request.referrer
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