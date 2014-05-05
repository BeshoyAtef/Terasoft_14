class PackagesController < ApplicationController
  def index
    @current_user_id = cookies[:user_id]
    @current_user_packages = Packages.find(:all, :conditions => {:senders_id => @current_user_id})
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @current_user_id = cookies[:user_id]
    @current_package = Packages.find(params[ :id ])
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
    data_validated = true
# or !(is_numeric(@weight)) or !(is_numeric(@receiver_mob_number)) !(is_numeric(@package_value)) or !(is_numeric(@carrying_price)) or
    if (@destination == nil or !(@destination =~ /\S/) or @expiry_date == nil or !(@expiry_date =~ /\S/) or @description == nil or !(@description =~ /\S/) or @origin == nil or !(@origin =~ /\S/) or @package_value == nil or !(@package_value =~ /\S/) or @carrying_price == nil or !(@carrying_price =~ /\S/) or @receiver_address == nil or !(@receiver_address =~ /\S/) or @receiver_email == nil or !(@receiver_email =~ /\S/) or @receiver_mob_number == nil or !(@receiver_mob_number =~ /\S/) or @weight == nil or !(@weight =~ /\S/) or !(@expiry_date =~ /\A(?:0?[1-9]|1[0-2])\/(?:0?[1-9]|[1-2]\d|3[01])\/\d{4}\Z/))
      data_validated = false
    end 

    if( @is_accepted != true && data_validated == true)
      # @package_id = @current_package.id
      # @current_package.id = @package_id
      # @current_package.destination = params[ :required_destination ]
      # @current_package.description = params[ :required_description ]
      # @current_package.origin = params[ :required_origin ]
      # @current_package.packageValue = params[ :required_num_value ]
      # @current_package.expiryDate = params[ :required_expirydate ]
      # @current_package.carryingPrice = params[ :required_num_price ]
      # @current_package.receiverAddress = params[ :required_address ]
      # @current_package.receiverMobNumber = params[ :required_num_mobile ]
      # @current_package.receiverEmail = params[ :required_email ]
      # @current_package.weight = params[ :required_num_weight ]
      # @current_package.senders_id = @current_user_id
      # @current_package.save
      Packages.edit_the_package(@current_package, @destination, @description, @origin, @package_value, @expiry_date, @carrying_price, @receiver_address, @receiver_mob_number, @receiver_email, @weight, @current_user_id)
      #notification(@current_user_id)
    end
    redirect_to :action =>'index'     
  end

  def list
  end

  def show
  end

  def delete
  end

  def destory
  end
end
