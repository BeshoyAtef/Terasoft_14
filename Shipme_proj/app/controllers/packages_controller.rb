class PackagesController < ApplicationController
#This method is to compare the Packageid with the selected package to view the selected package
#Return pack String
#Author: Mario M. Wadiee

  def packageview
    @pack = Packages.find(params[:pid])
  end
end