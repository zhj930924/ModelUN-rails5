class ResolutionRequestsController < ApplicationController

  def create
    current_user.requests.create(directive_id: params[:directive_id])

    respond_to do |format|
      format.html { redirect_to "redirect_to :back"}
      format.js
    end
  end

  def destroy
    current_user.requests.find_by(directive_id: params[:directive_id]).destroy
    redirect_to "static_pages/resolutions"
    respond_to do |format|
      format.html { redirect_to "redirect_to :back"}
      format.js
    end
  end

end