class HomepageController < ApplicationController

#This method calculates the total number of packages deliverd 
#Output: @packages_counter-int
#Author :Rehab A. ELShahawy

	def index
 			@packages_counter = Packages.find(:all, :conditions => {:finalDelivery => true}).count 

 	end	


# This method show the international prices
# Output: show the international prices of other companies in view international prices button
# Author: Omar A. Abdel-fatah

 	def list
 	end

end