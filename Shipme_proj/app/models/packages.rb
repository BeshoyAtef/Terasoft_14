class Packages < ActiveRecord::Base
require 'will_paginate/array'

	belongs_to :sender, :class_name => "Users"
	belongs_to :carrier, :class_name => "Users"
	has_many :payment
	has_one :reports
	has_many :requests
  validates :origin, presence: true
  validates :destination, presence: true
  validates :packageValue, presence: true
  validates :carryingPrice, presence: true
  validates :receiverAddress, presence:true
  validates :receiverMobNumber, presence:true
  validates :weight, presence: true


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

end
