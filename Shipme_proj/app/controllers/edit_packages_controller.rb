class EditPackagesController < ApplicationController

  #This method displays the form and the layout
  # no parameters because it just displays the form
  # Returns the form
  # Author: Youssef A. Saleh.

  def  edit_package
  end

  #This methods gets the user his list of trips to edit what he wants
  # current_user_id - int
  # current_user_packages - list of the user's package
  # Returns: list of the user's Packages
  # Author: Youssef A. Saleh
  
  def  index
    @current_user_id = 1
    @current_user_packages = Packages.find(:all, :conditions => {:senders_id => @current_user_id})
  end


  # This method send notification to the carrier when the sender edits his trip
  # requests - get the request of the current user
  # carriers_id - array of the carriers ids that sent requests to/from the user(sender)
  # carrier_id - each carrier_id in the matching list in requests
  # notification - the notification that will be sent to the carriers if any
  # user - gets the username of the carrier that will be notified
  # Returns: sends notification to the matching carriers if any
  # Author: Youssef A. Saleh

  def  notification (user_id)
    requests=Requests.find(:all, :conditions => {:senders_id => user_id})
    if(requests != nil)
      carriers_id = Array.new
      requests.each do |t|
      carrier_id = t.carriers_id;
      carriers_id.push carrier_id;
      end
      
      carriers_id.each do |s|
        notification =  Notifications.new;
        notification.users_id = s;
        user = Users.find_by_id(user_id).username
    
        requests.each do |t|
          if (t.carriers_id == s)
            notification.description = user +" "+ "deleted his trip, please try to find another carrier!";
            notification.save;
          end
        end
      end

      return;          
    end
  end


  # This method edits the package of the current user
  # current_user_id - the current logged in user - int
  # current_package - the package being edited - package
  # current_user_request - the carrying request of the current user - request
  # is_accepted - the status of the carrying request whether accepted or not - boolean
  # carrier_id - the carrier id that matches requests with the current user - int
  # destination - package's destination - String
  # description = package's description - String
  # origin - package's origin - origin
  # package_value - package's value - int
  # expiry_date - package's expiry date - date
  # carrying_price - package's price - int
  # receiver_address - package's receiver address - String
  # receiver_email - package's receiver_email - String
  # receiver_mob_number - package's receiver mobile number
  # weight - package's weight - int
  # data_validated - boolean
  # package - the edited package - package
  # Returns: edit the package details and send notification to the carrier if any
  # Author: Youssef A. Saleh

  def  update
    @current_user_id = 1
    @current_package = Packages.find(params[:id])
    @current_user_request = Requests.find(:all, :conditions => {:senders_id => @current_user_id, :packages_id => @current_package.id})
    @current_user_request.each do |t|
      @is_accepted = t.accept
      @carrier_id = t.carriers_id
    end
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
    @data_validated = true

    if (@destination == nil or @expiry_date == nil or @description == nil or @origin == nil or @package_value == nil or @carrying_price == nil or @receiver_address == nil or @receiver_email == nil or @receiver_mob_number == nil or @weight == nil or !(is_numeric(@package_value)) or !(is_numeric(@carrying_price)) or !(is_numeric(@weight)) or !(is_numeric(@receiver_mob_number)))
      @data_validated = false
    end  
    if(@current_user_id == @current_package.senders_id && @is_accepted == 0 && @data_validated == true)
      @package_id = @current_package.id
      @current_package.destroy
      @package = Packages.new
      @package.id = @package_id
      @package.destination = params[ :required_destination ]
      @package.description = params[ :required_description ]
      @package.origin = params[ :required_origin ]
      @package.packageValue = params[ :required_num_value ]
      @package.expiryDate = params[ :required_expirydate ]
      @package.carryingPrice = params[ :required_num_price ]
      @package.receiverAddress = params[ :required_address ]
      @package.receiverMobNumber = params[ :required_num_mobile ]
      @package.receiverEmail = params[ :required_email ]
      @package.weight = params[ :required_num_weight ]
      @package.senders_id = @current_user_id
      @package.save
      notification(@carrier_id)
    end
    redirect_to :action =>'index'     
  end


  # This method gets whether an object is an integer or not
  # o - the input sent to the method when called - object
  # Returns - boolean
  # Author: Youssef A. Saleh

  def  is_numeric(o)
    true if Integer(o) rescue false
  end

end
