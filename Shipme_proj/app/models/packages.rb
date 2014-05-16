class Packages < ActiveRecord::Base
require 'will_paginate/array'

	belongs_to :sender, :class_name => "Users"
	belongs_to :carrier, :class_name => "Users"
	has_many :payment
	has_one :reports
	has_many :requests

    #This method is called by method list in the controller.
    #input: senders_id, logged in user_id.
    #output: initialize the logged in user_id to the senders_id.
    #Author:  Ahmed M.Samouka.

	def self.view_all_packages(user_id)
	  @create_packages = Packages.find( :all ,:conditions => {:senders_id => user_id })
    end


    #This method initialise and create a new package and is called by create method from the controller.
    #input: all needed package variables.
    #output: save package to the databas.
    #Author:  Ahmed M.Samouka.

    def self.create_package(senders_id,destination,description,address,origin,mobnumber,email,weight,value,exdate)
        @create_packages = Packages.new
        @create_packages.senders_id=senders_id
        @create_packages.destination =  destination
        @create_packages.description =  description
        @create_packages.receiverAddress =  address
        @create_packages.origin =  origin
        @create_packages.receiverMobNumber =  mobnumber
        @create_packages.receiverEmail =  email
        @create_packages.weight =  weight
        @create_packages.packageValue = value
        @create_packages.expiryDate=exdate
        @create_packages.save
        $package_id=@create_packages.id
   end


   #This method is listing the packages done per month through pages.
   #amount - page
   #Returns array of packages done/month
   #Author:  Rana M. Elberishy.
 
    def self.view_shipments_paginated(page)
      @packages = Packages.find( :all, :conditions => {:finalDelivery => true}, :order => "created_at ASC" )
      @packages = @packages.paginate( :page => page , :per_page => 10 ) 
    end
  

  #This method checks if the logged in user is the same as the carriers_id and the receivedByCarrier should be still false to show all the pending packages to be confirmed.
  #carriers_id - integer, receivedByCarrier - boolean.
  #This method returns all the packges still waiting for confirmation.
  #Author: Ahmed H. Nasser.
   
    def self.confirm_package(user_id)
      @con = Packages.find( :all , :conditions => [ ' carriers_id = ? AND receivedByCarrier = ? ' , user_id , false ] )
    end	
  

  #This method checks the attributes of packages and set the receivedByCarrier to true to confirm taking the package.
  #description - string, expiryDate - date, destination - string, origin - string, receiverAddress - string, receiverMobNumber - integer,       receiverEmail - string, receivedByCarrier - boolean, finalDelivery - boolean, weight - float, type - string, carryingPrice - float, packageValue - float, rating - float, senders_id - integer.
  #This method confirms the package by the carrier
  #Author: Ahmed H. Nasser.
    
    def self.update_package(package_id)
      @comp = Packages.find(package_id)
      @new = Packages.new
      @new.id = @comp.id
      @new.description = @comp.description
      @new.expiryDate = @comp.expiryDate
      @new.destination = @comp.destination
      @new.origin = @comp.origin
      @new.receiverAddress = @comp.receiverAddress
      @new.receiverMobNumber = @comp.receiverMobNumber
      @new.receiverEmail = @comp.receiverEmail
      @new.finalDelivery = @comp.finalDelivery
      @new.weight = @comp.weight
      @new.carryingPrice = @comp.carryingPrice
      @new.packageValue = @comp.packageValue
      @new.rating = @comp.rating
      @new.senders_id = @comp.senders_id
      @new.receivedByCarrier = true
      @comp.destroy
      @new.save
    end	

end
