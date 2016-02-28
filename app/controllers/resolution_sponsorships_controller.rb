class ResolutionSponsorshipsController < ApplicationController
    
    def create
        ResolutionSponsorship.create(directive_id: params[:directive_id], user_id: params[:directive_id])
        respond_to do |format|
            format.html { redirect_to "static_pages/resolutions" }
            format.js
        end
    end
    
    def destroy
        ResolutionSponsorship.find_by(directive_id: params[:directive_id], user_id: params[:directive_id]).destroy
        respond_to do |format|
            format.html { redirect_to "static_pages/resolutions" }
            format.js
        end
    end

end