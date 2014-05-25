class NotificationController < ApplicationController


   #this methods should is used for viewing the notifications on a notification page
   #Returns: @notifications(Notifications model)
   #Author: Youssef S.Barakat 

  def  index
    @notifications = Notifications.find( :all, :conditions => {:users_id => cookies[:user_id]} )
    
    
  end
  
  def  test
    notify_rating
    redirect_to(:action => 'show')
  end

  def  show
   
  end


   #this methods should notify the sender to confirm that the package was received to remove the report against him
   #Returns: @notification(Notifications model)
   #Author: Youssef S.Barakat

  def  notify_final_delivery
    @reports = Reports.find( :all )
    @delivery = Packages.find( :all )
    if( @delivery != nil ) && ( @reports != nil )
      @reports.each do|t|
        @delivery.each do|s|
          if( ( t.reported_id == s.senders_id ) && ( s.finalDelivery == false ) && ( t.packages_id == s.id ) )
            @notification = Notifications.new
            @notification.users_id = s.senders_id
            @notification.description = "You should confirm the delivery of the package"
            @notification.save
         end
        end
     end
    end
    return;
  end 


   #this methods should notify the carrier that sender gave him a rating on a specific package
   #Inputs: cookies[:user_id]
   #Returns: @notification(Notifications model)
   #Author: Youssef S.Barakat 

  def  notify_rating
    @pack = Packages.find( :all, :conditions => {:senders_id => cookies[:user_id]} )
    if( @pack != nil )
      @pack.each do |t|
        @rating = Packages.find_by_id(t.id).finalDelivery
        @rate = Packages.find_by_id(t.id).carriers_id
        @rates = Packages.find_by_id(t.id).rating
        if( @rating == true ) && ( @rates != nil )
          @notification = Notifications.new
          @notification.users_id = @rate
          @notification.description = "You have been rated on a specific package"
        end
        @notification.save
      end
    end
    return;
  end


   #this methods should notify the sender and the carrier that an amount has been deducted from both of them when the carrier received the package from the sender and confirmed it
   #Returns: @notification(Notifications model)
   #Author: Youssef S.Barakat 

  def  notify_payment
    @pack  = Packages.find( :all,:conditions =>{:receivedByCarrier => true} )
    @pay = Payment.find( :all )
    if( @pack != nil ) && ( @pay != nil )
      @pack.each do |t|
        @pay.each do |s|
          if( t.id == s.packages_id )
            if( t.senders_id == s.users_id )
              @notification = Notifications.new
              @notification.users_id = t.senders_id
              @notification.description = "an amount has been deducted from your account"
              @notification.save
            elsif( t.carriers_id == s.users_id )
              @notifications = Notifications.new
              @notifications.users_id = t.carriers_id
              @notifications.description = "an amount of has been deducted from your account"
              @notifications.save
            end
          end
        end
      end
    end
    return;
  end


   #this methods should notify the carrier that an amount has been deducted and another one has been transferred to him when the sender confirmed that the package was received
   #Returns: @notification(Notifications model)
   #Author: Youssef S.Barakat 

  def  notify_finalpayment
    @pack = Packages.find( :all, :conditions => {:finalDelivery => true} )
    @pay = Payment.find( :all )
    if( @pack != nil ) && ( @pay != nil )
      @pack.each do |t|
        @pay.each do |s|
          if( t.id == s.packages_id ) && ( t.carriers_id = s.users_id )
            @notification = Notifications.new
            @notification.users_id = t.carriers_id
            @notification.description = "an amout has been added to your account and another amount has been deducted"
            @notification.save
          end
        end
      end
    end
    return;
  end


   #this methods should notify the sender that his national id was verified
   #Inputs: cookies[:user_id]
   #Returns: @notification(Notifications model)
   #Author: Youssef S.Barakat 

  def  verify_id_number
    @verification = Users.find_by_id(cookies[:user_id]).idVerify
    @notifications = Notifications.new
    @notifications.users_id = cookies[:user_id]
    if( @verification == true )
      @notifications.description = "Your id is verified"
    elsif( @verification != true )
      @notifications.description = "Your id is not verified"
    end
    @notifications.save
    return;
  end


   #this methods should notify the sender that a specific carrier accepted or rejected his request on a certain package
   #Inputs: cookies[user_id]
   #Returns: @notification(Notifications model)
   #Author: Youssef S.Barakat 

 def  notify_accept_reject_request
    @requests = Requests.find( :all, :conditions => {:carriers_id => cookies[:user_id]} )
    @packages = Packages.find( :all, :conditions => {:carriers_id => cookies[:user_id]} )
    if( @requests != nil )
      @senders_id = Array.new
      @requests.each do |t|
        sender_id = t.senders_id;
        @senders_id.push sender_id;
      end
      @senders_id.each do |s|
        @notify =  Notifications.new;
        @notify.users_id = s;
        @requests.each do |t|
          @packages.each do |p| 
            if( ( t.senders_id == s ) && ( t.accept !=false ) && ( t.packages_id==p.id ) )
              @notifications =  Notifications.new;
              @notifications.users_id = s;
              @notifications.description = "your request has been accepted"
              @notifications.save
            elsif( ( t.senders_id == s ) && ( t.accept == false ) ) 
              @notification =  Notifications.new;
              @notification.users_id = s;
              @notification.description = "your request has been rejected";
              @notification.save
            end
          end
        end
      end
    end
    return;
  end
end