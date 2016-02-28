class ResolutionSigningsController < ApplicationController
    
    def create
        current_user.signatures.create(directive_id: params[:directive_id])
        
        respond_to do |format|
            format.html { redirect_to "redirect_to :back"}
            format.js
        end        
    end
    
    def destroy
        current_user.signatures.find_by(directive_id: params[:directive_id]).destroy
        redirect_to "static_pages/resolutions"
        respond_to do |format|
            format.html { redirect_to "redirect_to :back"}
            format.js
        end
    end

end