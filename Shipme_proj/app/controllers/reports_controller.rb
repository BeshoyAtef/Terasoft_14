class ReportsController < ApplicationController
  
  #this method is to initialize all Reports attributes to view_reports.
  #all reports attributes.
  #void.
  #Auther:Ahmed M.Samouka.

  def index 
    @view_reportes = Reports.find( :all )
  end

  
  #This method is intended to show id of package in the package field .
  #Input : it takes the id of the logged in user .
  #output : returns package id.
  #Author : Mohamed A.Gheith.
  
  def new
   @packages = Packages.find(:all , :conditions => {:carriers_id => cookies[:user_id]})
  end


  #This method Creates a new Report.
  #Input : Requiredname - String,RequiredReport - String , RequiredPackageNo -String.
  #output : Saves report in database.
  #Author : Mohamed A.Gheith.

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


  #this method is intended to send an SMS to a user who have been reported.
  #Input:userId,user mobile number.
  #Output: SMS send.
  #Auther : Ahmed M.Samouka.

  def sendSms
     @temp = Users.find(params[ :id ])    
     @user = Users.find_by_id(@temp).mobileNumber.to_s
     @name = Users.find_by_id(@temp).username
     String @number = '+20'.to_s + @user
     SendSmsController.send_sms( @number,"dear MR/MRS "+@name+
     " you have been reported by the carrier for not confirming the final delivery of the package , please confirm as soon as possible 
     thank you 
    -shipme.com")
    redirect_to :action => 'index'
  end
end
