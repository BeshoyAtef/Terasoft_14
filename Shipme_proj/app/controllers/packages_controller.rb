class PackagesController < ApplicationController
  def index
  end



  #This method is to check if the logged in user id is verified and if not the system will not allow him to create a package
  #input: boolean to check , user.verifyid
  #output: allow or disallow the user to create package
  #Author:  Ahmed.M.Samouka

  def new
    @p = false
    @user = Users.find( cookies[ :user_id ] ) #.last().id
    @verify = @user.idVerify
    if @verify != true
      redirect_to :action => 'index'
    else
    end
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


  # This method is to get the rating of a package.
  # input: package id.
  # Author: Rana T. Labib.

  def rating
    @packages = Packages.find(params[:pid])
  end


  # This method is to update the package and insert the carrier's rating.
  # Input: user(sender) id and package id.
  # Author: Rana T. Labib.

  def update_rating
    @packages = Packages.find(params[:pid])
    @packages.update(:rating => params[:rate])
  end


  def delete
  end

  def destory
  end

  def confirm_delivery
    package = Packages.find_by_id(params[:pid])
    package.update(:finalDelivery => 1) 
    redirect_to :controller => 'packages', :action => 'rating', :pid => params[:pid]
  end

  def confirm_finaldelivery
    @con=Packages.confirm_finaldelivery(cookies[:user_id])
  end
end
