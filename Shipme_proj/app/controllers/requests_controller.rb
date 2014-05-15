class RequestsController < ApplicationController
  def index
  end

  def new
  end

  def create
     @requests_count = Requests.find( :all, :conditions => { :packages_id => params[:pid]} ).count
    @already = Requests.where(carriers_id: params[:cid] , packages_id: params[:pid] ).exists?
   if( @requests_count < 3 && @already == false  )

       Requests.send_requests( params[:cid] ,cookies[:user_id], params[:pid] )
   end
  end

  def edit
  end

  def update
  end

  def list
  end

  def show
  end

  def delete
  end

  def destory
  end

  def createhelper
    @requests_counter = Requests.find( :all, :conditions => { :packages_id => params[:pid]} ).count
  end
end
