class InsertCommisionController < ApplicationController


#This method creates new table 
#Author : Ahmed Tarek

  def new
    @configurations  = Configurations.new
  end


#This method add the parameters submited to the table
#Author : Ahmed Tarek

  def create      
    @configurations  = Configurations.new( configurations_params )
    @configurations.save
  end


#This method permit the parameters to be added
#Author : Ahmed Tarek

 private
  def configurations_params
    params.require( :configurations ).permit( :comission )
  end
end
