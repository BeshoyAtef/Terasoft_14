class RequestsController < ApplicationController
  require 'will_paginate/array'

  
  #This method gets an array of users that sent request to a certain user.
  #input: no input.
  #output: #users_Array.
  #Author: Mohamed M.Khairy.

  def index
    @requests=Requests.get_accepted_requests(cookies[:user_id],params[:page])
    @users = Array.new
    @requests.each do|request| 
      @user = Users.get_user(request.senders_id)
      @users.push @user
  end

  def new
  end


  #This method is counting the requests in the databse and check if the carrier id and package id are inserted before.
  #input: params[:pid] , params[:cid] , cookies[user_id] - integer.
  #return: number of packages - integer , already  - boolean.
  #Author: Manar A. Eltayeb.

  def create
    @requests_count = Requests.find( :all, :conditions => { :packages_id => params[:pid] } ).count
    @already = Requests.where( carriers_id: params[:cid] , packages_id: params[:pid] ).exists?
    Requests.send_requests( params[:cid] ,cookies[:user_id], params[:pid] )
  end

  def edit
  end

  def update
  end


  #This method gets an array of users that sent request to a certain user.
  #input: no input.
  #output: #users_Array.
  #Author: Mohamed M.Khairy.

  def list
    @requests = Requests.get_requests_paginated(cookies[:user_id],params[:page])
    @users = Array.new
    @requests.each do|request| 
      @user = Users.get_user(request.senders_id)
      @users.push @user
  end

  def show
    @request = Requests.show_request(params[:id])
    @package = Packages.find_by_id(@request.packages_id).receivedByCarrier
  end

  #This method show package.
  #input: no input
  #output:no output.
  #Author: Mohamed M.Khairy.

  def  show_package
    @package = Packages.find(params[ :id ])
  end

  def delete
  end

  def destory
  end


  #This method delete all other requests sent to other carriers from the sender.
  #Input: no input.
  #Output:update other requests from the sender to other carriers to let the sender null.
  #Author: Mohamed M.Khairy.
 
  def  accept_helper(requests)
    requests.each do|request|
      @requests_sender = Requests.get_requests_senders(request.senders_id)
      if @requests_sender!=nil
        @requests_sender.each do |sender|
          if(sender.accept == nil && request.accept == true && request.carriers_id != sender.carriers_id && sender.packages_id == request.packages_id)
             Requests.update_sender(sender)
          end
        end    
      end  
    end
  end


  #This method intends to update a givern request it's accept attribute with false.
  #Input: No input.
  #Output: updating the request.
  #Author: Mohamed M.Khairy.

  def reject
    request = Requests.show_request(params[:id])
    if (request.accept == nil)
      flag = false
      Requests.update_request(request,flag)
      notification (request.carriers_id)
      redirect_to(:action => 'list')
    end
  end

  #This method delete all other requests sent to other carriers from the sender.
  #Input: no input.
  #output:delete other requests from the sender to other carrier and notifyhim/her.
  #Author: Mohamed M.Khairy.

  def  accept 
    request = Requests.show_request(params[:id])
    @requests = Requests.get_requests(cookies[:user_id])
    @package = Packages.find_by_id(request.packages_id)
    if (request.accept == nil)
      flag=true
      Requests.update_request(request,flag)
      @package.update(:carriers_id => request.carriers_id)
      notification (request.carriers_id)
      accept_helper(@requests)
      redirect_to(:action => 'list')
    end
  end


  #This method cancels the request after accepting it.
  #input: no input.
  #output: updating boolean accept attribute in the request with false.
  #Author: Mohamed M.Khairy.

def cancel
    @request = Requests.show_request(params[:id])
    @package=Packages.find_by_id(@request.packages_id).receivedByCarrier
    if(@package!=true)
      user = Users.find_by_id(@request.carriers_id).username
      @notification = Notifications.new
      @notification.users_id = @request.senders_id
      @notification.description = user +" "+ "canceled your accepted request"
      @notification.save
      flag=false
      Requests.update_request(@request,flag)
      redirect_to(:action => 'index')
    end  
  end
  

  #This method notify sender if carrier accept or reject his/her request.
  #input: id of user carrier.
  #output:Insert notification in the database.
  #Author: Mohamed M.Khairy.

  def notification (user_id)
    @requests=Requests.get_requests(user_id)
    packages=Packages.find(:all, :conditions => {:carriers_id => user_id})
    if(@requests != nil)
      @senders_id = Array.new
      @requests.each do |request|
        sender_id = request.senders_id
        @senders_id.push sender_id
      end
      @senders_id.each do |sender|
        notification =  Notifications.new
        notification.users_id = sender;
        user = Users.find_by_id(user_id).username
        @requests.each do |request|
          packages.each do |package| 
            if((request.senders_id == sender) && (request.accept == true) && (request.packages_id==package.id))
              notification.description = user+" "+"accepted your request"
            elsif ((request.senders_id == sender) && (request.accept == false) && (request.packages_id==package.id)) 
              notification.description = user+" "+"rejected your request"
            end
          notification.save
          end
        end
      end
    end
  end
end


 #This method is counting the requests in the databse.
 #input: params[:pid] , params[:cid] , cookies[user_id] - integer.
 #output: number of packages - integer.
 #Author: Manar A. Eltayeb.
 
  def createhelper
    @requests_counter = Requests.find( :all, :conditions => { :packages_id => params[:pid]} ).count
  end

end
end
