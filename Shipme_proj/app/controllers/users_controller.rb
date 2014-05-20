class UsersController < ApplicationController
  def index
  end


  #This method calls the method count in table users.
  #@users-int.
  #Author: Ahmed T. Mohamed.

  def graph
     @users = Users.count
  end

  def create
  end


  #This method checks if enetered data is an integer.
  #input: no.
  #output: no.
  #Author : Mohamed A.Gheith.

  def is_numeric?(obj) 
   obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end


   #This method updates entered data from text field into database.
   #input : Credicard number -Integer, Mobile number -Integer , Password -string.
   #Returns data updated in database.
   #Author : Mohamed A.Gheith.

  def edit

    @edit = Users.find(cookies[ :user_id ])
    @e = Users.find(cookies[ :user_id ])
      if params[ :password ].present?
        @e.update( :encrypted_password => params[ :password ])
      end 
      if params[ :creditcard ].present? 
        @e.update( :creditCardNumber => params[ :creditcard ])
      end
      if params[ :mobilenumber ].present? 
        @e.update( :mobileNumber => params[ :mobilenumber ])
      end
      if params[ :password ]!=params[ :confirmPassword ]
        flash[ :notice ] ="password doesn't match"
        redirect_to( :action => index)
      elsif (is_numeric?(params[ :creditcard])==false && params[:creditcard].present?) 
        flash[ :notice ] ="please enter a number in the credit number"
        redirect_to( :action => index)
       elsif (is_numeric?(params[:mobilenumber])==false &&  params[:mobilenumber].present?)
         flash[ :notice ] ="please enter a number in the mobile number"
        redirect_to( :action => index )
      end 
  end


#This intended to insert and update the inforamation that is added by the user. 
#Input:mobileNumber(integer),idNumber(integer),Creditcard(integer).  
#Author: Mariam S. elSandy.

  def  update
    Users.complete_profile(cookies[ :user_id ],params[ :creditCard ],params[ :idNumber ])
  end


 #This method is calling methods that finds all the users,trips and packages and gets the package id.
 #Author: Manar A. Eltayeb.

  def list
    @package = Users.packages_find
    @trip = Users.trips_find
    @users =  Users.find_users
    $package_id=params.shift.last()
    @packages = Packages.find(:all , :conditions => { :id => $package_id})
  end


  #This method shows users with the given id and the trips with the given id.
  #Input : user_id - int.
  #Author: Salah K.Zalat.

  def  show
    $user_id=params[:id]
    @user=Users.get_profile($user_id)
    @trip=Trips.get_trips($user_id,params[:page])
   end

  def delete
  end

  def destory
  end
end
