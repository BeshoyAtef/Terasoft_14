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

  def list
  end

  def show
  end

  def delete
  end

  def destory
  end
end
