class RequestsController < ApplicationController
  
  def index
    @requests=Requests.find(:all ,:conditions => {:carriers_id =>cookies[:user_id], :accept => true})
      @requests=@requests.paginate(:page => params[:page], :per_page => 1)
    @users = Array.new
    @requests.each do|request|
      @user = Users.find(:all,:conditions => {:id =>request.senders_id})
      @users.push @user
  end
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

 def list
    @requests = Requests.find(:all, :conditions => {:carriers_id => cookies[:user_id], :accept => nil})
    @requests=@requests.paginate(:page => params[:page], :per_page => 1)
    @users = Array.new
    @requests.each do|request|
      @user = Users.find(:all, :conditions => {:id => request.senders_id})
      @users.push @user
  end
end

   def show
    @request = Requests.find(params[:id])
  end

  def delete
  end

  def destory
  end


 #This method is counting the requests in the databse.
 #input: params[:pid] , params[:cid] , cookies[user_id] - integer.
 #output: number of packages - integer.
 #Author: Manar A. Eltayeb.
 
  def createhelper
    @requests_counter = Requests.find( :all, :conditions => { :packages_id => params[:pid]} ).count
  end

  def  show_package
    @package = Packages.find(params[ :id ])
  end

  def  accept_helper(requests)
    requests.each do|request|
      @requests_sender = Requests.find(:all, :conditions => {:senders_id => request.senders_id})
      if @requests_sender!=nil
        @requests_sender.each do |sender|
          if(sender.accept == nil && request.accept == true && request.carriers_id != sender.carriers_id && sender.packages_id == request.packages_id)
             request.update(:senders_id => nil)
          end
        end   
      end 
    end
  end


  def reject
    request = Requests.find(params[:id])
    if (request.accept == nil)
      flag = false
      request.update(:accept => false)
      notification (request.carriers_id)
      redirect_to(:action => 'list')
    end
  end

  #This method delete all other requests sent to other carriers from the sender.
  #Input: no input.
  #output:delete other requests from the sender to other carrier and notifyhim/her.
  #Author: Mohamed M.Khairy.

  def  accept
    request = Requests.find(params[:id])
    @requests = Requests.find(:all, :conditions => {:carriers_id =>cookies[:user_id]})
    package = Packages.find_by_id(request.packages_id)
    if (request.accept == nil)
      flag=true
      request.update(:accept => true)
      package.update(:carriers_id => request.carriers_id)
      notification (request.carriers_id)
      accept_helper(@requests)
      redirect_to(:action => 'list')
    end
  end

  def cancel
    @request = Requests.find(params[:id])
    @package=Packages.find_by_id(@request.packages_id).receivedByCarrier
    if(@package!=true)
      user = Users.find_by_id(@request.carriers_id).username
      @notification = Notifications.new
      @notification.users_id = @request.senders_id
      @notification.description = user +" "+ "canceled your accepted request"
      @notification.save
      flag=false
      @request.update(:accept => false)
      redirect_to(:action => 'index')
    end 
  end

 def notification (user_id)
    @requests=Requests.find(:all,:conditions => {:carriers_id => user_id})
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
  
