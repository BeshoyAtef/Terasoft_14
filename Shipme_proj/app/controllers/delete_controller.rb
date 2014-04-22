class DeleteController < ApplicationController
  #This method finds all the packages then delete the package selected
  #There is no attributes for this method
  #This method doesnt return nothing
  #Author: Abdelrahaman Y. Seoudy
  def delete
  	
  	@c = Packages.find(params[:id])
  	@c.delete
  end
end
