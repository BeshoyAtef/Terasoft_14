class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

 #This method is calling method that finds all the users,trips and packages.
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
