class MatchesController < ApplicationController
  include ApplicationHelper
    
  def index
    @pets = Pet.all
    @pet = Pet.find(params[:pet_id])
    @matches = @pet.matches
    @sent_requests = @pet.sent_requests
    @received_requests = @pet.received_requests
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    return if current_user.pets.find(params[:pet_id]).id == params[:pet_id]
    return if match_request_sent?(Pet.find(params[:pet_id]))
    return if match_request_received?(Pet.find(params[:pet_id]))

    @pet = current_user.pets.find(params[:pet_id])
    @match = @pet.match_sent.build(sent_to_id: params[:pet_id])
    if @match.save
        flash[:success] = 'Request Sent!'
    else
        flash[:danger] = 'Request Failed!'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @match.destroy
    redirect_to pet_matches_path(@pet), notice: 'Match deleted!'
  end

  def accept_match
    @pet = current_user.pets.find(params[:pet_id])
    @match = Match.find_by(sent_by_id: params[:pet_id], sent_to_id: @pet.id, status: false)
    return unless @match

    @match.status = true
    if @match.save
        flash[:success] = 'Request Accepted!'
        @match2 = @pet.match_sent.build(sent_to_id: params[:pet_id], status: true)
        @match2.save
    else
        flash[:danger] = 'Request not Accepted!'
    end
    redirect_back(fallback_location: root_path)
  end

  def decline_match
    @pet = current_user.pets.find(params[:pet_id])
    @match = Match.find_by(sent_by_id: params[:pet_id], sent_to_id: @pet.id, status: false)
    return unless @match

    @match.destroy
    flash[:success] = 'Request Declined!'
    redirect_back(fallback_location: root_path)
  end
end
