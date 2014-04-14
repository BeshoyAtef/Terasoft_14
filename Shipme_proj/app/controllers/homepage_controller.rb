class HomepageController < ApplicationController

#This method calculates the total number of packages deliverd 
#Output: @packages_count-int
#Author :Rehab ELShahawy

 def index
 		@packages_count= Packages.find(:all, :conditions => {:finalDelivery => true}).count
 		
 end	

end