module ApplicationHelper
  def match_request_sent?(pet)
    Pet.find(params[:pet_id]).match_sent.exists?(sent_to_id: pet.id, status: false)
  end

  def match_request_received?(pet)
    Pet.find(params[:pet_id]).match_request.exists?(sent_by_id: pet.id, status: false)
  end

  def possible_match?(pet)
    request_sent = Pet.find(params[:pet_id]).match_sent.exists?(sent_to_id: pet.id)
    request_received = Pet.find(params[:pet_id]).match_request.exists?(sent_by_id: pet.id)

    return true if request_sent != request_received
    return true if request_sent == request_received && request_sent == true
    return false if request_sent == request_received && request_sent == false
  end
end