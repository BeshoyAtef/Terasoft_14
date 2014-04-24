class PackagelistController < ApplicationController
# This method show that list that has been created 
# Input: Id int 
# Output: show a list of packegs that has been created by the user
# Author: Omar A. Abdelfatah

  def  showlist
    @id = params[ :id ]
    @users = Users.find( :all )
    @list = Packages.find( :all , :conditions => ["senders_id = ?",@id])
  end
end
