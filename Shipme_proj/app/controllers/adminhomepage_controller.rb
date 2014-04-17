class AdminhomepageController < ApplicationController
  #This method is to create ahome page for admin.
  #Author:  Rana M. Elbishy.

  def  index
  
  end


  #This method is show shipments done.
  #@packages-array
  #Author:  Rana M. Elbishy.

  def  index
    @packages = Packages.find( :all, :conditions => {:finalDelivery => true, :creationDate => 0000-00-00 } )
  end

  end
