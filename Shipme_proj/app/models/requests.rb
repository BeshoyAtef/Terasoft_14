class Requests < ActiveRecord::Base
	belongs_to :sender, :class_name => "Users"
	belongs_to :carrier, :class_name => "Users"
	belongs_to :packages

	def self.current_user_requests(user_id, packages_id)
		current_user_request = Requests.find(:all, :conditions => {:senders_id => user_id, :packages_id => packages_id})
		return current_user_request
	end

	def self.requests_for_notification(user_id)
		current_user_request = Requests.find(:all, :conditions => {:senders_id => user_id})
		return current_user_request
	end
end

#@current_user_request = Requests.find(:all, :conditions => {:senders_id => @current_user_id, :packages_id => package.id})