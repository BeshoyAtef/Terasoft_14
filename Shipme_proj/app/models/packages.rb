class Packages < ActiveRecord::Base

	belongs_to :sender, :class_name => "Users"
	belongs_to :carrier, :class_name => "Users"
	has_many :payment
	has_one :reports
	has_many :requests
	def self.edit_the_package(current_package, destination, description, origin, package_value, expiry_date, carrying_price, receiver_address, receiver_mob_number, receiver_email, weight, user_id)
		current_package.each do |package|
			package.destination = destination
    	package.description = description
    	package.origin = origin
    	package.packageValue = package_value
    	package.expiryDate = expiry_date
    	package.carryingPrice = carrying_price
    	package.receiverAddress = receiver_address
    	package.receiverMobNumber = receiver_mob_number
    	package.receiverEmail = receiver_email
    	package.weight = weight
    	package.senders_id = user_id
    	package.save	
  	end
	end

	def self.find_current_package(id)
		current_package = Packages.find(:all, :conditions => {:id => id})
		return current_package
	end

	def self.find_user_packages(user_id)
		current_packages = Packages.find(:all, :conditions => {:senders_id => user_id})
		return current_packages
	end

end
