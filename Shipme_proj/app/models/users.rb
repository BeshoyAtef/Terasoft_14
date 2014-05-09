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
	

	#this methods should get users where id is verified or not
	#Inputs: cookies[:user_id]
    #Returns: @verification
    #Author: Youssef S.Barakat

	def self.get_users_verify (user_id)
		@verification = Users.find_by_id(user_id).idVerify
	end

end
