class ReportsController < ApplicationController
  
#This method is taking text input from html file and adding it in the database files
#Reports-string PackageNo-int
#It dosent return it adds in the database
#Mohamed A Gheith

  def CreateReport
  
    @rep = Reports.new
    @rep.description = params[ :requiredReport ]
    @rep.package_Id = params[ :requiredPackageNo ]
    @rep.save
    redirect_to :action => 'index'
  end
end
