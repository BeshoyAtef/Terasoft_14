class RequestsController < ApplicationController
  require 'will_paginate/array'

  def index
    @requests=Requests.get_accepted_requests(cookies[:user_id])
     @users = Array.new
    @requests.each do|request| 
      @user = Users.get_user(request.senders_id)
      @users.push @user
  end
  

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def list
    @requests = Requests.get_requests_paginated(cookies[:user_id],params[:page])
    @users = Array.new
    @requests.each do|request| 
      @user = Users.get_user(request.senders_id)
      @users.push @user
    end  
  end

  def show
    @request = Requests.show_request(params[:id])
    @package = Packages.find_by_id(request.packages_id)
  end

  def  show_package
    @package = Packages.find(params[ :id ])
  end

  def delete
  end

  def destory

      request = Requests.show_request(params[:id])
      @package=Packages.find_by_id(request.packages_id).receivedByCarrier
      if(@package!=true)
        user = Users.get_user(request.senders_id).username
        @notification = Notifications.new
        @notification.users_id= request.senders_id
        @notification.dscription=user+" "+"canceled your accepted request"
        @notification.save
        request.destrou 
      end  

  end

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

  def  accept_helper(requests)
    requests.each do|request|
      @requests_sender = Requests.get_requests_senders(request.senders_id)
      if @requests_sender!=nil
        @requests_sender.each do |sender|
          if(sender.accept == nil && request.accept==true && request.carriers_id != sender.carriers_id && sender.packages_id==request.packages_id)
             Requests.update_sender(sender)
          end
        end    
      end  
    end
  end  

  def reject
    request = Requests.show_request(params[:id])
    if (request.accept == nil)
      flag=false
      Requests.update_request(request,flag)
      NotificationController.notify_accept_reject_request
      redirect_to(:action => 'list')
    end
  end

  def notification (user_id)
    @requests=Requests.get_requests(user_id)
    packages=Packages.find(:all, :conditions => {:carriers_id => user_id})
    if(@requests != nil)
      @senders_id = Array.new
      @requests.each do |request|
        sender_id = request.senders_id;
        @senders_id.push sender_id;
      end
      @senders_id.each do |sender|
        notification =  Notifications.new;
        notification.users_id = sender;
         user = Users.find_by_id(user_id).username
        @requests.each do |request|
          packages.each do |package| 
            if((request.senders_id == sender) && (request.accept == true) && (request.packages_id==package.id))
              notification.description = user +" "+ "accepted your request";
            elsif ((request.senders_id == sender) && (request.accept == false) && (request.packages_id==package.id)) 
              notification.description = user +" "+ "rejected your request";
            end
          notification.save;
          end
        end
      end
    end
  end
end


