class ResolutionSponsorshipsController < ApplicationController
    before_action :authenticate_user!
    def create
        ResolutionSponsorship.create(directive_id: params[:directive_id], user_id: params[:resolution_sponsorship][:user_id])
        respond_to do |format|
            format.html { redirect_to request.referrer}
            format.js {render inline: "location.reload();" }
        end
    end
    
    def destroy
        if params[:user_id] != nil
            user_id = params[:user_id]
        else
          user_id = [:resolution_sponsorship][:user_id]
        end
        ResolutionSponsorship.find_by(directive_id: params[:directive_id], user_id: user_id).destroy
        directive = Directive.find_by(id: params[:directive_id])
        if directive.requestors.include?(current_user)
            ResolutionRequest.find_by(directive_id: params[:directive_id], user_id: params[:user_id]).destroy
        end
        respond_to do |format|
            format.html { redirect_to request.referrer }
            format.js {render inline: "location.reload();" }
        end
    end

end