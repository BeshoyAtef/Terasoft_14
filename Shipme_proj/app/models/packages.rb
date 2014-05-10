class Packages < ActiveRecord::Base

	belongs_to :sender, :class_name => "Users"
	belongs_to :carrier, :class_name => "Users"
	has_many :payment
	has_one :reports
	has_many :requests


	def self.get_package_messages(sender_id,receiver_id)
	@packages= Packages.find(:all,:conditions => ["senders_id = ? and 
		carriers_id = ? or senders_id = ? and carriers_id = ? ",
		sender_id,receiver_id,receiver_id,sender_id])

	end	


end
