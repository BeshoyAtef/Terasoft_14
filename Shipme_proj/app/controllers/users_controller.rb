class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
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

  def show
  end

  def delete
  end

  def destory
  end
end
