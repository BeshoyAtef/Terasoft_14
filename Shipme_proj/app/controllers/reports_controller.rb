class ReportsController < ApplicationController
  def index
  end
  #This method is intended to show id of package in the package field 
  #Input : it takes the id of the logged in user 
  #output : returns package id
  #Mohamed A.Gheith

  def new
   @packages = Packages.find(:all , :conditions => {:senders_id => cookies[:user_id]})
  end


  #This method Creates a new Report
  #Input : Requiredname - String,RequiredReport - String , RequiredPackageNo -String
  #output : Saves report in database
  #Mohamed A.Gheith

  def create
    Reports.create_report(cookies[:user_id],params[:requiredname],params[:requiredReport],params[:requiredPackageNo])
  end

  def edit
  end

  def update
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
