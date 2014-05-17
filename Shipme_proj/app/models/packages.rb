class Packages < ActiveRecord::Base
require 'will_paginate/array'

  require 'rubygems'
  #require 'googlecharts'
  #require 'gchart'

	belongs_to :sender, :class_name => "Users"
	belongs_to :carrier, :class_name => "Users"
	has_many :payment
	has_one :reports
	has_many :requests
  #validates :origin, presence: true
  #validates :destination, presence: true
  #validates :packageValue, presence: true
  #validates :carryingPrice, presence: true
  #validates :receiverAddress, presence:true
  #validates :receiverMobNumber, presence:true
  #validates :weight, presence: true


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



  #This methods should get all packages in packages model
  #Returns: @delivery
  #Author: Youssef S.Barakat

  def  self.get_all_packages
    @delivery = Packages.find(:all)
  end


  #This methods should get all packages with a specific rating
  #Inputs: cookies[user_id]-int
  #Returns: @pack
  #Author: Youssef S.Barakat

  def  self.get_packages_rating( user_id )
    @pack = Packages.find( :all, :conditions => {:senders_id => user_id} )
  end


  #This methods should get packages received by the carrier
  #Returns: @pack
  #Author: Youssef S.Barakat

  def  self.get_packages_payment
    @pack  = Packages.find( :all,:conditions =>{:receivedByCarrier => true} )
  end


  #This methods should get packages received by the receiver
  #Returns: @pack
  #Author: Youssef S.Barakat

  def  self.get_packages_final_payment
    @pack = Packages.find( :all, :conditions => {:finalDelivery => true} )
  end


  #This methods should get packages rated when received by receiver
  #Inputs: cookies[:user_id]-int
  #Returns: @rating
  #Author: Youssef S.Barakat

  def  self.get_packages_find_rating( user_id )
    @rating = Packages.find_by_id(user_id).finalDelivery
  end


  #this methods should get the specific carrier of a rated package when received by receiver 
  #Inputs: cookies[:user_id]-int
  #Returns: @rate
  #Author: Youssef S.Barakat

  def  self.get_packages_find_rate( user_id )
    @rate = Packages.find_by_id( user_id ).carriers_id
  end


  #This methods should get the rating packages rated when received by receiver
  #Inputs: cookies[:user_id]-int
  #Returns: @rates
  #Author: Youssef S.Barakat

  def  self.get_packages_find_rates( user_id )
    @rates = Packages.find_by_id( user_id ).rating
  end


  #This methods should get packages accepted by a specific carrier
  #Inputs: cookies[:user_id]-int
  #Returns: @packages
  #Author: Youssef S.Barakat

  def  self.get_packages_accept_reject( user_id )
    @packages = Packages.find( :all, :conditions => {:carriers_id => user_id} )
  end

  #This methods should get packages when the trip is deleted
  #Inputs: cookies[:user_id]-int
  #Returns: @packages
  #Author: Youssef S.Barakat

  def  self.get_packages_trip(user_id)
    @package = Packages.find( :all, :conditions => {:carriers_id => user_id } )
  end


  # This method edits a certain package.
  # is_accepted - int, curren_package - package, destination - int, description - int, origin - int, package_value - int, expiry_date - date, carrying_price - int, receiver_address - string, receiver_mob_number - string, receiver_email - string, weight - int, user_id - int.
  # Returns - boolean.
  # Author: Youssef A. Saleh.

  def self.edit_the_package(is_accepted, current_package, destination, description, origin, package_value, expiry_date, carrying_price, receiver_address, receiver_mob_number, receiver_email, weight, user_id)
    if (is_accepted != true)
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
      return true
    else
      return false
    end
  end


  # This method finds a certain package by id
  # id - int.
  # Returns - current_package.
  # Author: Youssef A. Saleh.

  def self.find_current_package(id)
    current_package = Packages.find(:all, :conditions => {:id => id})
    return current_package
  end

  #This method finds if there is at least one package between a certain sender and a certain carrier , to make sure they can send messages to each other.
  #Input: sender_id,receiver_id-int.
  #Output: @packages-array of packages.
  #Author: Rehab A.Elshahawy.

  def self.get_package_messages(sender_id,receiver_id)
    @packages= Packages.find(:all,:conditions => ["senders_id = ? and 
    carriers_id = ? or senders_id = ? and carriers_id = ? ",
    sender_id,receiver_id,receiver_id,sender_id])
    return @packages
  end 
  

  #This method search for a certain package using the ID.  
  #package_id - Integer.
  #Author: Abdelrahaman Y. Seoudy.

  def  self.find_package(package_id)
     @package = Packages.find(package_id)
  end 


  #This method is counting the shipments done.
  #Returns: @package_count-int.
  #Author:  Rana M. Elberishy.
  
  def  self.generate_shipments_graph
    @packages = Packages.find( :all, :conditions => {:finalDelivery => true} )
	  @packages_months = @packages.group_by { |package| package.created_at}
    @package_count = @packages_months.count
	end

end
