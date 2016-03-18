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

  
  private
      def directive_params
      params.require(:directive).permit(:content, :picture, :title, :type)
      end
end
