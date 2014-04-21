class ReportsController < ApplicationController
  def index
  end
 #
  def createReport
  
  	@rep = Reports.new
  	@rep.description = params[:requiredReport]
  	@rep.package_Id =params[:requiredPackageNo]
  	@rep.save
  	redirect_to :action => 'index'
  end
end
