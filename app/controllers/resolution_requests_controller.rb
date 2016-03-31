class ResolutionRequestsController < ApplicationController
  before_action :authenticate_user!
  def create
    current_user.requests.create(directive_id: params[:directive_id])

    respond_to do |format|
      format.html { redirect_to "redirect_to :back"}
      format.js {render inline: "location.reload();" }
    end
  end

  def destroy
    current_user.requests.find_by(directive_id: params[:directive_id]).destroy
    respond_to do |format|
      format.html { redirect_to "redirect_to :back"}
      format.js {render inline: "location.reload();" }
    end
  end

end