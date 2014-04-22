class EditPackagesController < ApplicationController
  def  edit_package
  end

  def  index
    @current_user_id = 1
    @current_user_packages = Packages.find(:all, :conditions => {:sender_Id => @current_user_id})
  end

  def  notification (user_id)
    requests=Requests.find(:all, :conditions => {:sender_Id => user_id})
    if(requests != nil)
      carriers_id = Array.new
      requests.each do |t|
      carrier_id = t.carrier_Id;
      carriers_id.push carrier_id;
      end
      
      carriers_id.each do |s|
        notification =  Notifications.new;
        notification.user_Id = s;
        user = Users.find_by_id(user_id).username
    
        requests.each do |t|
          if (t.carrier_Id == s)
            notification.description = user +" "+ "deleted his trip, please try to find another carrier!";
            notification.save;
          end
        end
      end

      return;          
    end
  end

  def  update
    @current_user_id = 1
    @current_package = Packages.find(params[:id])
    @current_user_request = Requests.find(:all, :conditions => {:sender_Id => @current_user_id}) #waiting for the package id
    @current_user_request.each do |t|
      @is_accepted = t.accept
      @carrier_id = t.carrier_Id
    end
    @destination = params[:requireddestination]
    @description = params[:requireddescription]
    @origin = params[:requiredorigin]
    @package_value = params[:requirednumvalue]
    @expiry_date = params[:requiredexpirydate]
    @carrying_price = params[:requirednumprice]
    @receiver_address = params[:requiredaddress]
    @receiver_mob_number = params[:requirednummobile]
    @receiver_email = params[:requiredemail]
    @weight = params[:requirednumweight]
    @data_validated = true


    #@destination == nil or @expiry_date == nil or @description == nil or @origin == nil or @package_value == nil or @carrying_price == nil or @receiver_address == nil or @receiver_email == nil or @receiver_mob_number == nil or @weight == nil or !(is_numeric(@package_value)) or !(is_numeric(@carrying_price)) or !(is_numeric(@weight)))


    if (@destination == nil or @expiry_date == nil or @description == nil or @origin == nil or @package_value == nil or @carrying_price == nil or @receiver_address == nil or @receiver_email == nil or @receiver_mob_number == nil or @weight == nil or !(is_numeric(@package_value)) or !(is_numeric(@carrying_price)) or !(is_numeric(@weight)) or !(is_numeric(@receiver_mob_number)))
      @data_validated = false
    end  
    if(@current_user_id == @current_package.sender_Id && @is_accepted != true && @data_validated == true) # && data_validated == true && @is_accepted != true
      @package_id = @current_package.id
      @current_package.destroy
      @package = Packages.new
      @package.id = @package_id
      @package.destination = params[:requireddestination]
      @package.description = params[:requireddescription]
      @package.origin = params[:requiredorigin]
      @package.packageValue = params[:requirednumvalue]
      @package.expiryDate = params[:requiredexpirydate]
      @package.carryingPrice = params[:requirednumprice]
      @package.receiverAddress = params[:requiredaddress]
      @package.receiverMobNumber = params[:requirednummobile]
      @package.receiverEmail = params[:requiredemail]
      @package.weight = params[:requirednumweight]
      @package.sender_Id = @current_user_id
      @package.save
      notification(@carrier_id)
    end
    redirect_to :action =>'index'     
  end

  def  is_numeric(o)
    true if Integer(o) rescue false
  end

end
