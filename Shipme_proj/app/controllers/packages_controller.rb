class PackagesController < ApplicationController
  def index
  end



  #This method is to check if the logged in user id is verified and if not the system will not allow him to create a package
  #input: boolean to check , user.verifyid
  #output: allow or disallow the user to create package
  #Author:  Ahmed.M.Samouka

  def new
    redirect_to :action => 'index'
  end


  #This method initialise and create a new package
  #input: package variable
  #output: save package to the databas
  #Author:  Ahmed.M.Samouka

  def create
    Packages.create_package( cookies[ :user_id ], params[ :requireddestination ], params[ :requireddescription ],
     params[ :requiredreceiverAddress ],params[ :requiredorigin ],params[ :requiredreceiverMobNumber ],
     params[ :receiverEmail ],params[ :requiredweight ], params[ :requiredpackageValue ], params[ :requiredexpiryDate ] )
  end

  def edit
  end

  def update
  end

  #This method show all packages created by the logged in user.
  #input: user id.
  #output: all packages created.
  #Author:  Ahmed M.Samouka.

  def list
    senders_id=cookies[ :user_id ]
    @create_packages=Packages.view_all_packages( senders_id )
  end

  #This method show specific packages choosen by the user.
  #input: package id.
  #output: show all the details of the packages.
  #Author:  Ahmed M.Samouka.

  def show
    @pack = Packages.find( params[ :id ] ) 
  end

  def delete
  end

  def destory
  end

  def confirm_delivery
  end  

  #This method calls the method update_package from the model.
  #This method confirms the package by the carrier
  #Author: Ahmed H. Nasser.
  
  def  confirm
    Packages.update_package(params[:id])
  end


  #This method calls the method confirm_package from the model.
  #This method returns all the packges still waiting for confirmation.
  #Author: Ahmed H. Nasser.
 
  def  list_takingpackage
    @con=Packages.confirm_package(cookies[:user_id]) 
  end
end
