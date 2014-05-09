class Notifications < ActiveRecord::Base
	belongs_to :users
	

   #this methods should create in the notifications model
   #Inputs: cookies[user_id], description
   #Author: Youssef S.Barakat

   def self.create (user_id,description)
		@notification = Notifications.new
		@notification.users_id = user_id
		@notification.description = description
		@notification.save
	end

    #this methods should get all notifications in notifications model
    #Inputs: cookies[user_id]
    #Returns: @notifications
    #Author: Youssef S.Barakat

	def self.get_notifications (user_id)
		@notifications = Notifications.find( :all, :conditions => {:users_id => user_id} )
	end
end
