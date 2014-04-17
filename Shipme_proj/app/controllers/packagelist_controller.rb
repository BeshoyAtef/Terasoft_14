class PackagelistController < ApplicationController
# this method create a list to store the packages 
# list string
#
#author: Omar Abdelfatah

  def list
    @list = package.find(:all)
  end


# this method show that list that has been created 
# list string
# package string
#
#author: Omar Abdelfatah

  def  showlist
    @list = List.find( params[:id] )
    @package = package.names
    respond_to do |format|
    format.html
  end
  end

