class User < ActiveRecord::Base
	validates_length_of :mobileNumber, :minimum => 10
 validates_length_of :creditCard, :is => 5 
 validates_length_of :idNumber, :is => 5 
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

end
