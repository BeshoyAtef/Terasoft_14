class Requests < ActiveRecord::Base
	belongs_to :sender, :class_name => "Users"
	belongs_to :carrier, :class_name => "Users"
	belongs_to :packages


  # This method gets the requests that a certain user is the carrier of them.
  # user_id - int.
  # Returns - array of requests.
  # Author: Youssef A. Saleh.

  def self.requests_for_edit_notification(user_id)
     current_user_request = Requests.find(:all, :conditions => {:carriers_id => user_id})
     return current_user_request
  end

  # This method gets the user's requests.
  # user_id - int, packages_id - int.
  # Returns - current_user_request.
  # Author: Youssef A. Saleh.

  def self.current_user_requests(user_id, packages_id)
    current_user_request = Requests.find(:all, :conditions => {:senders_id => user_id, :packages_id => packages_id})
    return current_user_request
  end


  # This method gets whether one request of the user is accepted or not
  # requests - array of requests.
  # Returns - @is_accepted.
  # Author: Youssef A. Saleh.

  def self.get_acceptance(requests)
    @is_accepted = false
    requests.each do |t|
    @is_accepted = t.accept
    @carrier_id = t.carriers_id
    if (@is_accepted == true)
      break
    end
    end
    return @is_accepted
  end
end
