class HomepageController < ApplicationController

#This method calculates the total number of packages deliverd 
#Output: @packages_counter-int
#Author :Rehab A. ELShahawy

	def index
 			@packages_counter = Packages.find(:all, :conditions => {:finalDelivery => true}).count 

 	end	

 	def list
 	end

end