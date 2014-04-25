class ReportsController < ApplicationController
  
#This method is taking text input from html file and adding it in the database files
#Reports-string PackageNo-int
#It dosent return it adds in the database
#Mohamed A Gheith


  def CreateReport
  
    @rep = Reports.new
    @rep.reporters_id =  cookies[ :user_id ] 
    @rep.description = params[ :requiredReport ]
    @rep.packages_id = params[ :requiredPackageNo ]
    	if @rep.save
    		redirect_to :action => 'index'
		end
  end
end
