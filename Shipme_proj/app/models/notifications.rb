class Notifications < ActiveRecord::Base
	belongs_to :users


	# This method creates a new notification with it's user's id.
  # user_id - int.
  # Returns - notification.
  # Author: Youssef A. Saleh.

	def self.set_notification(user_id)
		notification = Notifications.new
		notification.users_id = user_id
		return notification
	end


	# This method sets the description of a certain notification.
  # notification - notification, description, string.
  # Author: Youssef A. Saleh.

	def self.create_notification_trip(notification, description)
		notification.description = description
		notification.save
	end
end