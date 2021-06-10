class MatchesController < ApplicationController
  include ApplicationHelper
    
  def index
    @pets = Pet.all
    @pet = current_user.pets.find(params[:pet_id]) # current pet
    @pet_matches = @pet.pet_matches
    @sent_requests = @pet.sent_requests
    @received_requests = @pet.received_requests
  end

  # def show
  #   @pet = Pet.find(params[:pet_id])
  # end

  def pet_match
    return if Pet.find(params[:pet_id]).id == params[:id]
    return if match_request_sent?(Pet.find(params[:pet_id]))
    return if match_request_received?(Pet.find(params[:pet_id]))

    @match = Pet.find(params[:pet_id]).match_sent.build(sent_to_id: params[:id]) # must send id to possible matches
    if @match.save
      flash[:success] = 'Request Sent!'
    else
      flash[:danger] = 'Request Failed!'
    end
    redirect_back(fallback_location: root_path)
  end

  # def destroy
  #   @match.destroy
  #   redirect_to pet_matches_path(@pet), notice: 'Match deleted!'
  # end

  def accept_match
    @pet = Pet.find(params[:pet_id])
    @match = Match.find_by(sent_by_id: params[:id], sent_to_id: @pet.id, status: false)
    return unless @match

    @match.status = true
    if @match.save
      flash[:success] = 'Request Accepted!'
      @match2 = @pet.match_sent.build(sent_to_id: params[:id], status: true)
      @match2.save
    else
      flash[:danger] = 'Request not Accepted!'
    end
    redirect_back(fallback_location: root_path)
  end

  def remove_match
    @pet = Pet.find(params[:pet_id])
    @match = Match.find_by(sent_by_id: params[:id], sent_to_id: @pet.id, status: true)
    return unless @match

    @match.destroy
    flash[:success] = 'Match removed!'
    redirect_back(fallback_location: root_path)
  end

  # private

  # def match_params
  #   params.require(:match).permit(:sent_by_id, :sent_to_id, :status)
  # end

end

# users = pets.map(&:user)
# pets.map { |pet| pet.user }
