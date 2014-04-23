class CreatePackagesController < ApplicationController

  # GET /create_packages
  # GET /create_packages.json
  
  #this method is initializing create_packages to packages
  # create_packages
  # all done packages
  #Author:  Ahmed Samouka

  def index
    @create_packages = Packages.all
  end


  # GET /create_packages/1
  # GET /create_packages/1.json

  #show list of created packages
  # successfuly created packages
  # a list of created packages with details
  #Auther: Ahmed Samouka


  # GET /create_packages/new
  def new
    @user = Users.find(:all).last().id
  @verify = Users.find(@user).idVerify
    if @verify != 1 
      redirect_to :action => 'index'
    else
       
    end
  end

def show_package
  @pack = Packages.find(params[:id])

end


def show

  
    @create_packages = Packages.new
    @create_packages.destination =  params[:destination]
    @create_packages.description =  params[:description]
    @create_packages.receiverAddress =  params[:receiverAddress]
    @create_packages.origin =  params[:origin]
    @create_packages.receiverMobNumber =  params[:receiverMobNumber]
    @create_packages.receiverEmail =  params[:receiverEmail]
    @create_packages.weight =  params[:weight]
    @create_packages.packageValue =  params[:packageValue]
    @create_packages.save
    


end
  # POST /create_packages
  # POST /create_packages.json
  
  #this method is creating a new package
  #packages parameters
  #return a success message and redirect to show
  #Author:Ahmed Samouka

  def create
    @c = Packages.find(:all).last()
    @id = @c.id
    redirect_to :action => 'show_package?id=@id'

  end

 
  

end
