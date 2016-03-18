class CrisisUpdatesController < DirectivesController
  def new
    @crisis_update = current_user.crisis_updates.build
  end

  def create
    if current_user.crisis_updates.create(type: params[:crisis_update][:type],
                                          content: params[:crisis_update][:content],
                                          title: params[:crisis_update][:title])
      flash[:success] = "Crisis Updates Created!"
      redirect_to crisis_update_path
    else
      flash[:error] = "Fail"
      redirect_to request.referrer
    end
  end

  def crisis_updates
    if user_signed_in?
      @user = current_user
      @cs_feed = CrisisUpdate.all.paginate(page: params[:cs_page])

      if current_user[:type] == "Crisis"
        @directive = current_user.crisis_updates.build
      end
    else redirect_to root_url
    end
  end

  private
      def directive_params
          params.require(:crisis_updates).permit(:content, :picture, :title, :type)
      end
end