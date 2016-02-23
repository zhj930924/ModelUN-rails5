class StaticPagesController < ApplicationController
  def home
    if logged_in?
      
      if current_user[:type] == "Crisis"
        user_ids = "SELECT delegate_id FROM manages WHERE crisis_id = :crisis_id"
        personal_directive_ids = "SELECT directive_id FROM directives_users 
                        WHERE user_id IN (#{user_ids}) AND type = 'PersonalDirective'"
        committee_directive_ids = "SELECT directive_id FROM directives_users 
                        WHERE user_id IN (#{user_ids}) AND type = 'Resolution'"
        @feed_items = PersonalDirective.where("id in (#{personal_directive_ids})", 
                                            crisis_id: current_user[:id]).paginate(page: params[:page])
        @secondary_feed = Resolution.where("id in (#{committee_directive_ids})",
                                        crisis_id: current_user[:id]).paginate(page: params[:page])
        
      elsif current_user[:type] == "Delegate"
        @feed_items = CrisisUpdate.all.paginate(page: params[:page])
        committee_directive_ids = "SELECT directive_id FROM directives_users
                                  WHERE user_id = :user_id"
        @secondary_feed = Resolution.where("id IN (#{committee_directive_ids})",
                                      user_id: current_user[:id]).paginate(page: params[:page])
      end
      
      @directive = current_user.directives.build
      
    end
  end

  
  def personal_directives
    if logged_in?
      @user = current_user
      @directive = current_user.directives.build if logged_in?
      if (current_user[:type] == "Delegate")
        @feed_items = current_user.personal_directives.paginate(page: params[:page])
        
      elsif(current_user[:type] == "Crisis")  
        personal_directive_ids = "SELECT directive_id FROM directives_users
                                  WHERE user_id = :user_id and type = 'IssueDirective'"
        @feed_items = PersonalDirective.where("id IN (#{personal_directive_ids})",
                                      user_id: current_user[:id]).paginate(page: params[:page])
                                      
      end
    else redirect_to root_url
    end
  end
  
  def committee_directives
    if logged_in?
      @user = current_user
      @directive = current_user.directives.build if logged_in?
      if (current_user[:type] == "Delegate")
        @feed_items = current_user.committee_directives.paginate(page: params[:page])
        
      elsif(current_user[:type] == "Crisis")  
        committee_directive_ids = "SELECT directive_id FROM directives_users
                                  WHERE user_id = :user_id"
        @feed_items = CommitteeDirective.where("id IN (#{committee_directive_ids})",
                                      user_id: current_user[:id]).paginate(page: params[:page])
      
      end
    else redirect_to root_url
    end
  end
  
  def crisis_updates
    if logged_in?
      @user = current_user
      @directive = current_user.directives.build if logged_in?
      if (current_user[:type] == "Delegate")
        @feed_items = current_user.personal_directives.paginate(page: params[:page])
        
      elsif(current_user[:type] == "Crisis")  
        committee_directive_ids = "SELECT directive_id FROM directives_users
                                  WHERE user_id = :user_id"
        @feed_items = CrisisUpdate.where("id IN (#{committee_directive_ids})",
                                      user_id: current_user[:id]).paginate(page: params[:page])
                                      
      end
    else redirect_to root_url
    end
  end
  
end
