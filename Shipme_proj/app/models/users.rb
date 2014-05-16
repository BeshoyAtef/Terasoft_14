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
 end
