class EditPackagesController < ApplicationController
  def edit_package
  end

  def index
    @userId = 1
    @lis = Packages.find(:all, :conditions => {:sender_Id => @userId})
  end

  #def edit_trips
  #end

  def edit_package
  end
  
  def notification (user_id)
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

  def update
    @userId = 1
    @tr = Packages.find(params[:id])
    #@request = Requests.find(:all, :conditions => {:sender_Id => @userId}).accept
    #@accepted = Requests.find(:accept).where(:sender_Id => @userId)
    @request = Requests.find(:all, :conditions => {:sender_Id => user_id}) #waiting for the package id
    @request.each do |t|
      @accept=t.accept
    end
    #@accepted = Requests.find(params[:sender_Id]).where(sender_Id => @userId)
    @destination = params[:requireddestination]
    @description = params[:requireddescription]
    @origin = params[:requiredorigin]
    @packageValue = params[:requiredvalue]
    @expiryDate = params[:requiredexpirydate]
    @carryingPrice = params[:requiredprice]
    @receiverAddress = params[:requireddestination]
    @receiverMobNumber = params[:requireddestination]
    @receiverEmail = params[:requireddestination]
    @weight = params[:requiredweight]

    s = true
    if (@destination == nil or @description == nil or @origin == nil or @packageValue == nil or @carryingPrice == nil or @receiverAddress == nil or @receiverEmail == nil or @receiverMobNumber == nil or @weight == nil)
     s = false
    end  
    
       # if (@description.length == 0)
       #  puts "please enter destination"
       # end



      if(@userId == @tr.sender_Id && s == true && @accept != true)
       @t = @tr.id
       @tr.destroy
       @package = Packages.new
       @package.id = @t
       @package.destination = params[:requireddestination]
       @package.description = params[:requireddescription]
       @package.origin = params[:requiredorigin]
       @package.packageValue = params[:requiredvalue]
       @package.expiryDate = params[:requiredexpirydate]
       @package.carryingPrice = params[:requiredprice]
       @package.receiverAddress = params[:requireddestination]
       @package.receiverMobNumber = params[:requireddestination]
       @package.receiverEmail = params[:requireddestination]
       @package.weight = params[:requiredweight]
       @package.sender_Id = @userId
       @package.save
       notification(@userId)
      end
     redirect_to :action =>'index'     
  end
end
