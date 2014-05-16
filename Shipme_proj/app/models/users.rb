class Users < ActiveRecord::Base
	has_many :messages
	has_many :notifications
	has_many :packages
	has_many :payment
	has_many :reports
	has_many :requests
	has_many :trips
	has_many :senders, :through => :requests
	has_many :carriers, :through => :requests
	has_many :reporter, :through => :reports
	has_many :reported, :through => :reports
	has_many :senders, :through => :packages
	has_many :carriers, :through => :packages
	has_many :senders, :through => :messages
	has_many :receivers, :through => :messages
	
#This method gets all users.
#Returns users - array.
#Author Madeleine A. Saad.

	def self.all_users
	   @users = Users.find(:all)
	end


#This method gets all users with a certain name.
#username - string.
#Returns users_with_same_name - array.
#Author Madeleine A. Saad.

    def self.search_users_with_same_name(username)
    	@users_with_same_name=Users.find(:all, :conditions => ['username LIKE ?', "#{username}%"])
    end
end
