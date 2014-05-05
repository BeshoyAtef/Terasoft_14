class RequestsController < ApplicationController

  def index
    @requests_counter = Requests.count_requests( params[:pid] )
    

    end

  def new
  end

  def create
    @requests_count = Requests.find( :all, :conditions => { :packages_id => params[:pid]} ).count
   if( @requests_count < 3 )

       Requests.send_requests( cookies[:user_id] , params[:cid] , params[:pid] )
    
  end

  def edit
  end

  def update
  end

  def list
   
  end
  end

  def show
  end

  def delete
  end

  def destory
  end
end
