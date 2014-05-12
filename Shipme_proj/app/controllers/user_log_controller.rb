class UserLogController < ApplicationController

#The method is sigining up
#Author: John W.Ghali
  
  def sign_up
  end


#The method is redirecting to the signin
#Author: John W.Gahli

  def sign_in2
    redirect_to :action => "sign_in" ,:controller => "user_log"
  end


#The method is saving the input to the database
#Input: email string- username string- password string- mobilenumber int
#Author: John W.Ghali

  def create
    @all = Users.find_users
    @approve = true
    @all.each do |a|
      if (a.username == params[ :username ]) 
        @approve = false
      end
    end
    if(@approve == false)
        redirect_to :action => 'used'
    else
    @user=Users.create(params[:email],params[:username],params[:password],params[:mobilenum])
    end
  end


#The method is signing in. It redirects to the homepage with saving the user id by cookies
#Author: John W.Ghali

  def sign_in
    if cookies[ :user_id ] != nil
      redirect_to :action => "index" ,:controller => "homepage"
    end
  end


#The method is comparing the input with the database
#Return: When the sigin is true it redirects me to hompage and when it is false it redirects to a wrong username or password page
#Author: John W.Ghali

  def in
    @var = Users.find_users
    @salout = "Wrong username or password"
    if cookies[ :user_id ] != nil
      redirect_to :action => "index" ,:controller => "homepage"
    else
      @var.each do |v|
        if ( v.username == params[ :username ] )
          if( v.encrypted_password == params[ :password ])
            cookies[ :user_id ] = v.id
            cookies[ :username ] = v.username
            redirect_to :action => "index" ,:controller => "homepage"
            return
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

    end
  end


#The method is logging out
#Return: It redirects to the sign in page
#Author: John W.Ghali

  def log_out
    cookies.delete :user_id
    cookies.delete :username
    redirect_to :action => "sign_in"
  end
end

