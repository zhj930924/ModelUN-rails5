class PersonalDirectivesController < DirectivesController
  def new
    @personal_directives = current_user.personal_directives.build
  end

  def create
      pd = current_user.personal_directives.build(content: params[:personal_directive][:content],
                                              title: params[:personal_directive][:title])
      if pd.save
        flash[:success] = "Directive created!"
        current_user.issue_directives.create(directive_id: pd.id)
        redirect_to personal_directive_path
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

  def index

    @filterrific = initialize_filterrific(
        PersonalDirective,
        params[:filterrific],
        select_options: {
            with_tag_name: Tag.options_for_select,
            with_user: User.options_for_select,
        }
    ) or return
    filter_result = @filterrific.find


    if user_signed_in?
      @user = current_user
      if current_user[:type] == "Delegate"
        personal_directive_ids = "SELECT directive_id FROM directives_users
                          WHERE user_id = :id AND type = 'IssueDirective'"
        sql_result = PersonalDirective.where("id IN (#{personal_directive_ids})",
                                             id: current_user[:id]).paginate(page: params[:pd_page])
        @pd_feed = []
        filter_result.each do |result|
          if sql_result.include?(result)
            @pd_feed << result
          end
        end
        @directive = current_user.directives.build(type: "PersonalDirective")

      elsif current_user[:type] == "Crisis"
        user_ids = "SELECT delegate_id FROM manages WHERE crisis_id = :crisis_id"
        personal_directive_ids = "SELECT directive_id FROM directives_users
                          WHERE user_id IN (#{user_ids}) AND type = 'IssueDirective'"
        sql_result = PersonalDirective.where("id IN (#{personal_directive_ids})",
                                             crisis_id: current_user[:id]).paginate(page: params[:pd_page])
        @pd_feed = []
        filter_result.each do |result|
          if sql_result.include?(result)
            @pd_feed << result
          end
        end
      end
      @pd_feed = @pd_feed.paginate(page: params[:pd_page])
    else redirect_to root_url
    end
  end

  private
    def directive_params
      params.require(:personal_directive).permit(:content, :picture, :title, :type)
    end
end