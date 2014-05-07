class PackagesController < ApplicationController
  def index
  end

  def new
    @p = false
    @user = Users.find( cookies[ :user_id ] ) #.last().id
    @verify = @user.idVerify
    if @verify != true
      redirect_to :action => 'index'
    else
       
    end
  end

  def create
    Packages.create_package(cookies[:user_id], params[ :requireddestination ], params[ :requireddescription ],
     params[ :requiredreceiverAddress ],params[ :requiredorigin ],params[ :requiredreceiverMobNumber ],
     params[ :receiverEmail ],params[ :requiredweight ], params[ :requiredpackageValue ], params[:requiredexpiryDate])


  end

  def edit
  end

  def update
  end

  def list
    senders_id=cookies[:user_id]
    #@create_packages = Packages.all
    @create_packages=Packages.view_all_packages(senders_id)
  end

  def show
    @pack = Packages.find( params[ :id ] ) 
  end

  def delete
  end

  def destory
  end
end
