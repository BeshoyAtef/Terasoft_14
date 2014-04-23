class UsersRegisterdController < ApplicationController


#This method count number of rows in table Users
#@users - int
#Author : Ahmed Tarek

  def count
    @users  = Users.count
    render :action => :users
  end
end
