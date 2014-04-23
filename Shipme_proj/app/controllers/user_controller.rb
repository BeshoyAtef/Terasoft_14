class UserController < ApplicationController

def signup
end
#The method is saving the input to the database
#username string- email string- encrypted password string- mobilenumber int
#When the signup is true it redirects me to a sucessfully signup and when it is false it pops out something wrong
#Author: John W.Ghali
	def create
		@all = Users.find(:all)
		@approve = true
		@all.each do |a|
	    if (a.username == params[:username]) 
		      @approve = false
		end
    end


	if(@approve == false)
		redirect_to :action => 'used'
	end


	@new = Users.new
	@new.email = params[:email]
	@new.username = params[:username]
	@new.encrypted_password = params[:password]
	@new.mobileNumber = params[:mobilenum]
	@new.save

        
end


def signin
end

#The method is comparing the input with the database
#username string- password string
#When the sigin is true it redirects me to a welcome page and when it is false it redirects to a wrong username or password page
#Author: John W.Ghali
	def in
		@var = Users.find(:all)
		@salout = "Wrong username or password"
		@var.each do |v|
			if (v.username == params[:username])
				if( v.encrypted_password == params[:password])
					@salout = "welcome " + v.username
				end
			end

	end

end

def forgot_mail
	@var = Users.find(:all)
	@salout = "Please enter a valid email, then try again"
	@var.each do |v|
		if (v.email == params[:mail])
	        @salout = "An email will be sent with your password to " + v.email + " in a few minutes"
		end
	Admin.forgot_mail(params[:mail])
	
    end
    end
end