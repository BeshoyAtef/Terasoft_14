class AdminController < ApplicationController
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


#This method count number of rows in table Users
#@users - int
#Author : Ahmed T. Mohamed

  def list
    @users  = Users.counter
    render :action => :users
  end

  def show
  end

  def delete
  end

  def destory
  end
end
