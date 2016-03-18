class ResolutionsController < DirectivesController

  def new
    @resolution = current_user.created_resolutions.build
  end

  def create
    resolution = current_user.created_resolutions.build(type: params[:resolution][:type],
                                                       content: params[:resolution][:content],
                                                       title: params[:resolution][:title])
    if resolution.save
      flash[:success] = "Resolutions/Committee Directives Created!"
      resolution.creations.create(user_id: current_user[:id])

      if params[:resolution][:sponsors] != nil
        params[:resolution][:sponsors].each do |sponsor|
          resolution.sponsorships.create(user_id: sponsor)
        end
      end

      if params[:resolution][:signers] != nil
        params[:resolution][:signers].each do |signer|
          resolution.signatures.create(user_id: signer)
        end
      end
      redirect_to root_url
    else
      flash[:error] = "Fail"
      @resolution = resolution
      render "resolutions/new"
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

  def public_resolutions
    if user_signed_in?
      @user = current_user
      if current_user[:type] == "Delegate"
        resolutions_ids = "SELECT directive_id FROM directives_users
                                  WHERE user_id = :user_id"
        @rs_feed = Resolution.where("public = 't'").paginate(page: params[:rs_page])
        @resolution = current_user.created_resolutions.build

      elsif current_user[:type] == "Crisis"
        user_ids = "SELECT delegate_id FROM manages WHERE crisis_id = :crisis_id"
        committee_directive_ids = "SELECT directive_id FROM directives_users
                        WHERE user_id IN (#{user_ids}) AND type IN ('ResolutionSponsorship',
                        'ResolutionSigning', 'ResolutionCreation')"
        @rs_feed = Resolution.where("id IN (#{committee_directive_ids})",
                                    crisis_id: current_user[:id]).paginate(page: params[:rs_page])

      end
    else redirect_to root_url
    end
  end

  def private_resolutions
    if user_signed_in?
      @user = current_user
      if current_user[:type] == "Delegate"
        resolutions_ids = "SELECT directive_id FROM directives_users
                                  WHERE user_id = :user_id"
        @rs_feed = Resolution.where("id IN (#{resolutions_ids} and public = 'f')",
                                    user_id: current_user[:id]).paginate(page: params[:rs_page])
        @resolution = current_user.created_resolutions.build
      end
    else redirect_to root_url
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

  def resolution_management
    @sponsorship = current_user.sponsorships.new
    @signature = current_user.signatures.new
  end


  private
      def directive_params
          params.require(:resolution).permit(:content, :picture, :title, :type, :editable, :passed, :public)
      end
end