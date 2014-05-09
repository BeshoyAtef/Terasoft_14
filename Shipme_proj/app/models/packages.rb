class Packages < ActiveRecord::Base

	belongs_to :sender, :class_name => "Users"
	belongs_to :carrier, :class_name => "Users"
	has_many :payment
	has_one :reports
	has_many :requests
	

	#this methods should get all packages in packages model
    #Returns: @delivery
    #Author: Youssef S.Barakat

	def self.get_all_packages
		@delivery = Packages.find(:all)
	end


	#this methods should get all packages with a specific rating
    #Inputs: cookies[user_id]
    #Returns: @pack
    #Author: Youssef S.Barakat

	def self.get_packages_rating (user_id)
		@pack = Packages.find( :all, :conditions => {:senders_id => user_id} )
	end


	#this methods should get packages received by the carrier
    #Returns: @pack
    #Author: Youssef S.Barakat

	def self.get_packages_payment
		@pack  = Packages.find( :all,:conditions =>{:receivedByCarrier => true} )
	end


	#this methods should get packages received by the receiver
    #Returns: @pack
    #Author: Youssef S.Barakat

	def self.get_packages_final_payment
		@pack = Packages.find( :all, :conditions => {:finalDelivery => true} )
	end


	#this methods should get packages rated when received by receiver
	#Inputs: cookies[:user_id]
    #Returns: @rating
    #Author: Youssef S.Barakat

	def self.get_packages_find_rating (user_id)
		@rating = Packages.find_by_id(user_id).finalDelivery
	end


	#this methods should get the specific carrier of a rated package when received by receiver 
	#Inputs: cookies[:user_id]
    #Returns: @rate
    #Author: Youssef S.Barakat

	def self.get_packages_find_rate (user_id)
		@rate = Packages.find_by_id(user_id).carriers_id
	end


	#this methods should get the rating packages rated when received by receiver
	#Inputs: cookies[:user_id]
    #Returns: @rates
    #Author: Youssef S.Barakat

	def self.get_packages_find_rates (user_id)
		@rates = Packages.find_by_id(user_id).rating
	end


	#this methods should get packages accepted by a specific carrier
	#Inputs: cookies[:user_id]
    #Returns: @rating
    #Author: Youssef S.Barakat

	def self.get_packages_accept_reject (user_id)
		@packages = Packages.find( :all, :conditions => {:carriers_id => user_id} )
	end

end
