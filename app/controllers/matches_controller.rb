class MatchesController < ApplicationController
  include ApplicationHelper
  
  def create
    return if current_user.pets(:pet_id) == params[:pet_id]
    return if match_request_sent?(current_user.pets.find(params[:pet_id]))
    return if match_request_received?(current_user.pets.find(params[:pet_id]))

    @pet = current_user.pets.find(params[:pet_id])
    @match = current_user.pets.match.build(receiver_id: params[:pet_id])
    @match.save
    
    redirect_back(fallback_location: root_path)
  end

  def accept_match
    @match = Match.find_by(requestor_id: params[:pet_id], receiver_id: current_user.pets(:id). status: false)
    return unless @match

    @match.status = true
    @match.save
    @match2 = current_user.pets(:pet_id).matches_as_requestor.build(receiver_id: params[:pet_id], status: true)
    @match2.save

    redirect_back(fallback_location: root_path)
  end

  def decline_match
    @match = Match.find_by(requestor_id: params[:pet_id], receiver_id: current_user.pets(:id), status: false)
    return unless @match
    
    @match.destroy
    redirect_back(fallback_location: root_path)
  end
end
