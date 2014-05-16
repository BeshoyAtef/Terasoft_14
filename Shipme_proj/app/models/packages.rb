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

  def  self.get_packages_trip( user _id )
    @packages = Packages.find( :all, :conditions => {:carriers_id => user_id } )
  end


end
