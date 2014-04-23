class CreatePackagesController < ApplicationController


  #this method is initializing create_packages to packages
  # create_packages
  # all Packages 
  #Author:  Ahmed.M.Samouka

  def  index
    @create_packages = Packages.all
  end


  #ths method is to make sure that the id of the user is verified
  # idVerify from database
  # if the id is verified he should be able to create a package else he will not 
  #Auther: Ahmed.M.Samouka

  def  new
    @p = false
    @user = Users.find( :all ).last().id
    @verify = Users.find( @user ).idVerify
    if @verify != 1 
      redirect_to :action => 'index'
    else
       
    end
  end


  #this method is showing the created package
  #package parameters
  #show the last created package
  #Author:Ahmed.M.Samouka

  def  show_package
    @pack = Packages.find(params[ :id ])
  end


  #this method is creating a new package and show it 
  #packages parameters
  #redirect to index
  #Author:Ahmed.M.Samouka

  def  show
    @create_packages = Packages.new
    @create_packages.destination =  params[ :requireddestination ]
    @create_packages.description =  params[ :requireddescription ]
    @create_packages.receiverAddress =  params[ :requiredreceiverAddress ]
    @create_packages.origin =  params[ :requiredorigin ]
    @create_packages.receiverMobNumber =  params[ :requiredreceiverMobNumber ]
    @create_packages.receiverEmail =  params[ :receiverEmail ]
    @create_packages.weight =  params[ :requiredweight ]
    @create_packages.packageValue =  params[ :requiredpackageValue ]
    @create_packages.save
  end


  #this method is after creating the package rediretct to show package with the id of the last created package to show it to the user
  #packages parameters
  #redirect to show_package
  #Author:Ahmed.M.Samouka

  def  create
    @c = Packages.find( :all ).last()
    @id = @c.id
    redirect_to :action => 'show_package?id=@id'

  end
end
