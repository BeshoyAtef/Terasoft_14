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

	def self.packages_find
		@packages = Packages.find(:all)
	end
	def self.users_find
		@user = Users.find(:all)
	end
	def self.trips_find
		@trips = Trips.find(:all)
	end


end
