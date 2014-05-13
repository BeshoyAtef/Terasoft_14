class Packages < ActiveRecord::Base

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

end
