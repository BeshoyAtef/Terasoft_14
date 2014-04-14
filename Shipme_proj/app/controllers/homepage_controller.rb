class HomepageController < ApplicationController

#this method calculates the total number of packages deliverd 
#packages_count-int
#Author :Rehab ELShahawy

 def index
 		@packages_count= Packages.counter.count
 end	

end