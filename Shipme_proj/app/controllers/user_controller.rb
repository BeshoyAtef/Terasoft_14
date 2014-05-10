class UserController < ApplicationController


#The method is sigining up
#Input: username string- email string- encrypted password string- mobilenumber int
#Return: When the signup is true it redirects me to page create showing a sucessfully signup and when it is false it pops out something wrong
#Author: John W.ghali

    def signup
    end


#The method is redirecting to the signin
#Author: John W.Gahli

  def signin2
    redirect_to :action => "signin" ,:controller => "user"
  end


#The method is saving the input to the database
#Return: When the signup is true it redirects me to a sucessfully signup
#Author: John W.Ghali

  def create
    @all = Users.find(:all)
    @approve = true
    @all.each do |a|
      if (a.username == params[ :username ]) 
        @approve = false
      end
    end


      if(@approve == false)
      redirect_to :action => 'used'
      end


    @new = Users.new
    @new.email = params[ :email ]
    @new.username = params[ :username ]
    @new.encrypted_password = params[ :password ]
    @new.mobileNumber = params[ :mobilenum ]
    @new.save

        
  end


#The method is signing in with saving the user id by cookies
#Input: Username string- password string
#Return: It redirects to the homepage
#Author: John W.ghali

  def signin
    if cookies[ :user_id ] != nil
      redirect_to :action => "index" ,:controller => "homepage"
    end
  end


#The method is comparing the input with the database
#Return: When the sigin is true it redirects me to hompage and when it is false it redirects to a wrong username or password page
#Author: John W.Ghali

  def in
    @var = Users.find(:all)
    @salout = "Wrong username or password"
    if cookies[ :user_id ] != nil
        redirect_to :action => "index" ,:controller => "homepage"
    else
      @var.each do |v|

        if ( v.username == params[ :username ] )
          if( v.encrypted_password == params[ :password ])
            cookies[ :user_id ] = v.id
            cookies[ :username ] = v.username
            #this if condition redirect the user after logging in to the right home page
            #if the user is an admin redirects to admin homepage otherwise redirects to normal homepage
            #Author: Rehab A.Elshahawy
             if(v.admin == true)
              redirect_to :action => "index" ,:controller => "admin"
              else
              redirect_to :action => "index" ,:controller => "homepage"
            return
          end
        end
    end
  end
end 

end


#The method is resting the password to the user
#Input: email string
#Return: It redirects to a page that an email will be sent with the password or a pop message to enter a valid email
#Author: John W.Ghali

  def forgot_mail
    @var = Users.find( :all )
    @salout = "Please enter a valid email, then try again"
    @var.each do |v|
      if (v.email == params[ :mail ])
         @salout = "An email will be sent with your password to " + v.email + " in a few minutes"
      end
    Admin.forgot_mail(params[ :mail ])
  
   end
 end


#The method is logging out
#Return: It redirects to the sign in page
#Author: John W.Ghali

   def logout
    cookies.delete :user_id
    cookies.delete :username
    redirect_to :action => "index" ,:controller => "homepage"

    end
end