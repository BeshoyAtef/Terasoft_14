class AdminController < ApplicationController

  require 'rubygems'
  #require 'googlecharts'
  #require 'gchart'
  require 'will_paginate/array'

  def index
    render layout: false
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    
  end
  

   #This method is listing the packages done per month through pages.
   #amount - page
   #Returns array of packages done/month
   #Author:  Rana M. Elberishy.

  def list
    @packages = Packages.view_shipments_paginated( params[:page] )
    render layout: false
  end


  #This method is listing the packages done per month through pages.
  #Returns @package_count-int for graph.
  #Author:  Rana M. Elberishy.
  
  def  chart
    @package_count = Packages.generate_shipments_graph
  end

  def  show
    
  end   
  
  def delete
  end

  def destory
  end
end
