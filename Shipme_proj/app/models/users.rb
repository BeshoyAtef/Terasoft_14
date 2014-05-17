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
  #validates :username, presence: true
  #validates :email, presence: true
  #validates :encrypted_password, presence: true
  #validates :mobileNumber, presence:true



#The method is saving the input to the database
#Input: username string- email string- encrypted password string- mobilenumber int
#Return: When the signup is true it redirects me to a sucessfully signup
#Author: John W.Ghali

  def self.create(email,username,password,mobilenum)
    @test = mobilenum.to_s
    @user = Users.new
    @user.email=email
    @user.username=username
    @user.encrypted_password=password
    @user.mobileNumber=mobilenum 
    @user.save
    @user1 ='+20'.to_s + @test
    SendSmsController.send_sms(@user1 , "Welcome to Shipme Website")
  end


#The method find users
#Author: John W.Ghali

  def self.find_users
    @users=Users.find(:all)
  end	


#This method gets all users with a certain name.
#username - string.
#Returns users_with_same_name - array.
#Author Madeleine A. Saad.

    def self.search_users_with_same_name(username)
      @users_with_same_name=Users.find(:all, :conditions => ['username LIKE ?', "#{username}%"])
    end

    
#This method is intended to insert the inforamation that is added by the user. 
#Input:mobileNumber,idNumber,Creditcard-integer.  
#Author: Mariam S. elSandy.

  def  self.complete_profile(user_id,creditcard,id_num)
    @user=Users.find_by_id(user_id)
    if Users.exists?(:id => user_id)
    @user.update(:creditCardNumber => creditcard,:idNumber=> id_num)
    @user.save
    end
  end

  #This methods should get users where id is verified or not
  #Inputs: cookies[:user_id]-int
  #Returns: @verification
  #Author: Youssef S.Barakat

  def  self.get_users_verify( user_id )
    @verification = Users.find_by_id( user_id ).idVerify
  end


  #This methods should get users where id is verified or not
  #Inputs: cookies[:user_id]-int
  #Returns: @user
  #Author: Youssef S.Barakat

  def  self.get_users_credit( user_id )
    @user = Users.find( :all, :conditions => {:id => user_id } )
  end

   #This method is finding all the packages in the database.
   #Returns: @packages - array.
   #Author : Manar A. Eltayeb.

    def  self.packages_find
      @packages = Packages.find( :all )
    end


   #This method is finding all the trips in the database.
   #Returns: @trips - array.
   #Author : Manar A. Eltayeb.

    def  self.trips_find
      @trips = Trips.find( :all )
    end


  #This method takes user id and updates his password.
  #Input : Password-String.
  #Output : Saves new data in database.
  #Author : Mohamed A.Gheith.

  def self.UpdatePass(user,password)
    user.update( :password => password )
  end 


  #This method takes user id and updates his CreditCard.
  #Input : creditCard-Integer.
  #Output : Saves new data in database.
  #Author : Mohamed A.Gheith.

  def self.UpdateCredit(user,creditCard )
    user.update( :creditCardNumber => creditcard )
    end


  #This method takes user id and updates his Mobile number.
  #Input : mobileNumber-Integer.
  #Output : Saves new data in database.
  #Author : Mohamed A.Gheith.

    def self.UpdateMobile(user,mobileNumber)
      user.update( :mobileNumber=> mobileNumber )
    end

 end

