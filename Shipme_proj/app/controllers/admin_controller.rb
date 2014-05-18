class AdminController < ApplicationController
  require 'will_paginate/array'

  def index
  end

  def new
  end

  def create
  end
#This intent to list the national ids that idVerified is equal null
#output:list of idNumbers
#Author: Mariam S. elSanady
  

  def edit
    @users = Users.verify_id
  end

#this intended to update the params idVerified by the admin by true.
#input:id of the user.
#Author: Mariam S. elSanady.

  def update
    Users.update_verify(params[:id])
  end
  

  #This method is listing the packages done per month through pages.
  #amount - page.
  #Returns array of packages done/month.
  #Author:  Rana M. Elberishy.

  def list
    @packages = Packages.view_shipments_paginated( params[:page] )
  end

  def show
  end

  def delete
  end

  def destory
  end

#this intended to update the params idVerified by the admin by false.
#input:id of the user.
#Author: Mariam S. elSanady.

  def  update1
    Users.update_unverify(params[:id])
  end
end
