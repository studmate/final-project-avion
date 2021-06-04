module ApplicationHelper
    def match_request_sent?(pet)
      current_user.matches_sent.exists?(receiver_id: pet.id, status: false)
    end

    def match_request_received?(pet)
      current_user.matches_request.exists?(requestor_id: pet.id, status: false)
    end

    def possible_friend?(pet)
      request_sent = current_user.matches_sent.exists?(receiver_id: pet.id)
      request_received = current_user.matches_request.exists?(requestor_id: pet.id)

      return true if request_sent != request_received
      return true if request_sent == request_received && request_sent == true
      return false if request_sent == request_received && request_sent == false
    end
end
