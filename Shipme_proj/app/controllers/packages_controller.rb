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


  # This method gets whether an object is an integer or not
  # o - the input sent to the method when called - object
  # Returns - boolean
  # Author: Youssef A. Saleh

  def is_numeric(o)
    true if Integer(o) rescue false 
  end


  #This method displays the form and the layout.
  # Author: Youssef A. Saleh.

  def edit
  end


  # This method edits the package of the current user.
  # current_user_id - int, current_package - package, current_user_request - request, is_accepted- boolean, current_id - int, carrier_id -  int, destination - String, description - String, origin - String, package_value - int, expiry_date - date, carrying_price - int, receiver_address - String, receiver_email - String, receiver_mob_number - int, weight - int, data_validated - boolean, package - package.
  # Author: Youssef A. Saleh.

  def update
    @current_user_id = cookies[:user_id]
    @current_package = Packages.find_current_package(params[ :id ])
    @current_package.each do |package|
      @current_user_request = Requests.current_user_requests(@current_user_id,package.id)
      $current_id = package.id
    end
    @is_accepted = Requests.get_acceptance(@current_user_request)
    @destination = params[ :required_destination]
    @description = params[ :required_description ]
    @origin = params[ :required_origin ]
    @package_value = params[ :required_num_value ]
    @expiry_date = params[ :required_expirydate ]
    @carrying_price = params[ :required_num_price ]
    @receiver_address = params[ :required_address ]
    @receiver_mob_number = params[ :required_num_mobile ]
    @receiver_email = params[ :required_email ]
    @weight = params[ :required_num_weight ]
    data_validated = true
    if  (!(@expiry_date =~ /(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})/) or @destination == nil or !(@destination =~ /\S/) or @expiry_date == nil or !(@expiry_date =~ /\S/) or @description == nil or !(@description =~ /\S/) or @origin == nil or !(@origin =~ /\S/) or @package_value == nil or !(@package_value =~ /\S/) or @carrying_price == nil or !(@carrying_price =~ /\S/) or @receiver_address == nil or !(@receiver_address =~ /\S/) or @receiver_email == nil or !(@receiver_email =~ /\S/) or @receiver_mob_number == nil or !(@receiver_mob_number =~ /\S/) or @weight == nil or !(@weight =~ /\S/) or !is_numeric(@weight) or !is_numeric(@package_value) or !is_numeric(@carrying_price))
      data_validated = false
    end
    if(@is_accepted != true && data_validated == true)
      temp = Packages.edit_the_package(@is_accepted, @current_package, @destination, @description, @origin, @package_value, @expiry_date, @carrying_price, @receiver_address, @receiver_mob_number, @receiver_email, @weight, @current_user_id)
      flash[:notice] = "Your package was edited successfully!"  
      redirect_to :action =>'list'
    elsif (@destination == nil or !(@destination =~ /\S/) or @expiry_date == nil or !(@expiry_date =~ /\S/) or @description == nil or !(@description =~ /\S/) or @origin == nil or !(@origin =~ /\S/) or @package_value == nil or !(@package_value =~ /\S/) or @carrying_price == nil or !(@carrying_price =~ /\S/) or @receiver_address == nil or !(@receiver_address =~ /\S/) or @receiver_email == nil or !(@receiver_email =~ /\S/) or @receiver_mob_number == nil or !(@receiver_mob_number =~ /\S/) or @weight == nil or !(@weight =~ /\S/))
      flash[:notice] = "one or more inputs are not entered, please enter everything correctly and try again"  
      redirect_to(:action => 'edit', :id => $current_id)
    elsif (!is_numeric(@weight) or !is_numeric(@package_value) or !is_numeric(@carrying_price))
      flash[ :notice ] = "please enter numbers only in the weight/value/carrying price field(s)"
      redirect_to(:action => 'edit', :id => $current_id)
     elsif (!(@expiry_date =~ /(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})/))
       flash[ :notice ] = "Please enter date in the format of dd/mm/yyyy, and try again!"
       redirect_to(:action => 'edit', :id => $current_id)
    elsif (@is_accepted == true)
      flash[ :notice ] = "Sorry, your package can NOT be edited, because it is accepted be a carrier through you carrying request!"
      redirect_to :action =>'list'              
    end
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

  def confirm_delivery
    package = Packages.find_by_id(params[:pid])
    package.update(:finalDelivery => 1) 
    redirect_to :controller => 'packages', :action => 'rating', :pid => params[:pid]
  end

  def confirm_finaldelivery
    @con=Packages.confirm_finaldelivery(cookies[:user_id])
  end
end
