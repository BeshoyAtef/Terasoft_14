class AdminController < ApplicationController
  def index
  render layout: false
  @packages = Packages.find(:all, :conditions => {:finalDelivery => true}).count 
  
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
  end

  def show
  end

  def delete
  end

  def destory
  end
end
