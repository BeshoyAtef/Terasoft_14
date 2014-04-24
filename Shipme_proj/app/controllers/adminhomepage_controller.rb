class AdminhomepageController < ApplicationController
  #This method is to create ahome page for admin.
  #Author:  Rana M. Elbrishy.

  def  index
  
  end


  #This method shows all shipments done according to specific date
  #Returns @packages-array[packages]
  #Author:  Rana M. Elbrishy.

  def  view_shipments
    @packages = Packages.find( :all, :conditions => {:finalDelivery => true, :created_at => 0000-00-00 } )
  end

  end
