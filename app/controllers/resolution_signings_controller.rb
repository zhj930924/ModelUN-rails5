class ResolutionSigningsController < ApplicationController
    
    def create
        if params[:resolution_signing][:user_id] != nil
            ResolutionSigning.create(directive_id: params[:directive_id], user_id: params[:resolution_signing][:user_id])
        else
            current_user.signatures.create(directive_id: params[:directive_id])
        end

        respond_to do |format|
            format.html { redirect_to request.referrer}
            format.js
        end        
    end
    
    def destroy
        if params[:resolution_signing][:user_id] != nil
            ResolutionSigning.find_by(directive_id: params[:directive_id], user_id: params[:resolution_signing][:user_id]).destroy
        else
            current_user.signatures.find_by(directive_id: params[:directive_id]).destroy
        end

        respond_to do |format|
            format.html { redirect_to request.referrer}
            format.js
        end
    end

end