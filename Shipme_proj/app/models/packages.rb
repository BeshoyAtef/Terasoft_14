class Packages < ActiveRecord::Base

	belongs_to :sender, :class_name => "Users"
	belongs_to :carrier, :class_name => "Users"
	has_many :payment
	has_one :reports
	has_many :requests
	def self.edit_the_package(current_package, destination, description, origin, package_value, expiry_date, carrying_price, receiver_address, receiver_mob_number, receiver_email, weight, user_id)
		current_package.destination = destination
    current_package.description = description
    current_package.origin = origin
    current_package.packageValue = package_value
    current_package.expiryDate = expiry_date
    current_package.carryingPrice = carrying_price
    current_package.receiverAddress = receiver_address
    current_package.receiverMobNumber = receiver_mob_number
    current_package.receiverEmail = receiver_email
    current_package.weight = weight
    current_package.senders_id = user_id
    current_package.save	
	end

end
