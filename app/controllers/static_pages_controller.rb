class StaticPagesController < ApplicationController
  
  def home
    if user_signed_in?
      if current_user[:type] == "Crisis"
        user_ids = "SELECT delegate_id FROM manages WHERE crisis_id = :crisis_id"
        personal_directive_ids = "SELECT directive_id FROM directives_users 
                        WHERE user_id IN (#{user_ids}) AND type = 'IssueDirective'"
        committee_directive_ids = "SELECT directive_id FROM directives_users 
                        WHERE user_id IN (#{user_ids}) AND type IN ('ResolutionSponsorship', 
                        'ResolutionSigning', 'ResolutionCreation')"
        @pd_feed = PersonalDirective.where("id in (#{personal_directive_ids})", 
                                            crisis_id: current_user[:id]).paginate(page: params[:pd_page], per_page: 5)
        @rs_feed = Resolution.where("id in (#{committee_directive_ids})",
                                        crisis_id: current_user[:id]).paginate(page: params[:rs_page], per_page: 5)
        
      elsif current_user[:type] == "Delegate"
        @cs_feed = CrisisUpdate.all.paginate(page: params[:cs_page], per_page: 5)
        committee_directive_ids = "SELECT directive_id FROM directives_users
                                  WHERE user_id = :user_id"
        @pd_feed = PersonalDirective.where("id IN (#{committee_directive_ids})",
                                      user_id: current_user[:id]).paginate(page: params[:pd_page], per_page: 5)
      end
      
      @directive = current_user.directives.build
      
    end
  end

  
  def personal_directives

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
                          WHERE user_id == :id AND type = 'IssueDirective'"
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
  
  def public_resolutions
    if user_signed_in? 
      @user = current_user
      if current_user[:type] == "Delegate"
        resolutions_ids = "SELECT directive_id FROM directives_users
                                  WHERE user_id = :user_id"
        @rs_feed = Resolution.where("public = 't'").paginate(page: params[:rs_page])
        @directive = current_user.created_resolutions.build
        
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
        @directive = current_user.created_resolutions.build
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
  
  def notes
    if user_signed_in?
      @user = current_user
      if  current_user[:type] == "Delegate"
        redirect_to root_url
      elsif(current_user[:type] == "Crisis")
        @directive = current_user.notes.build if user_signed_in?
        @note_feed = Note.all.paginate(page: params[:note_page])
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
      params.require(:directive).permit(:content, :picture, :title, :type)
      end
end
