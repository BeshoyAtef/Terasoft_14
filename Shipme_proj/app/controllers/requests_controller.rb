class RequestsController < ApplicationController
  def index
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
  end

  def show
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
end
