class RequestsController < ApplicationController
 def delreq  #delrejectedrequests
 	Request.all.each do|r|
 		if r.accept == false
 			r.destroy
 		end
 	end
  end 
end
