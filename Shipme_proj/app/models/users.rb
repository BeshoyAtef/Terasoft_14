class Users < ActiveRecord::Base
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


#The method is saving the input to the database
#Input: username string- email string- encrypted password string- mobilenumber int
#Return: When the signup is true it redirects me to a sucessfully signup
#Author: John W.Ghali

  def self.create(email,username,password,mobilenum)
    @user = Users.new
    @user.email=email
    @user.username=username
    @user.encrypted_password=password
    @user.mobileNumber=mobilenum 
    @user.save
  end


#The method find users
#Author: John W.Ghali

   def self.find_users
     @users=Users.find(:all)
   end	

    #This method is finding all the packages in the database.
	#return all the packages.
	#Author : Manar A. Eltayeb.


   def self.packages_find
		@packages = Packages.find(:all)
	end



    #This method is finding all the users in the database.
	#return all the users.
	#Author : Manar A. Eltayeb.

	def self.trips_find
		@trips = Trips.find(:all)
	end
end
