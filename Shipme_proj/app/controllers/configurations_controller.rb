class ConfigurationsController < ApplicationController
  def index
  end

  def new
  end


  #This method calls the create method in the model configurations 
#Author : Ahmed T. Mohamed

  def create 
    Configurations.create ( configurations_params)
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
  

  #This method permit the parameters to be added
#Author : Ahmed T. Mohamed

  private
  def configurations_params
    params.require( :configurations ).permit( :comission )
  end
end
