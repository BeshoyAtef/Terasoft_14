class NotificationsController < ApplicationController
  
  #This methods should is used for viewing the notifications on a notification page
  #Returns: @notifications(Notifications model)
  #Author: Youssef S.Barakat

  def list
    @notifications = Notifications.get_notifications(cookies[:user_id])
  end


  def  index
  end
  
  
  #This methods should is used for testing the notifications method
  #Returns: @notifications(Notifications model)
  #Author: Youssef S.Barakat

  def  test
    notify_credit_problem
    redirect_to(:action => 'show')
  end

  def  show
  end

  
  #This methods should notify the sender to confirm that the package was received to remove the report against him
  #Returns: @notification(Notifications model)
  #Author: Youssef S.Barakat

  def  notify_final_delivery
    @reports = Reports.get_all_reports
    @delivery = Packages.get_all_packages
    if( @delivery != nil ) && ( @reports != nil )
      @reports.each do|t|
        @delivery.each do|s|
          if( ( t.reported_id == s.senders_id ) && ( s.finalDelivery == false ) && ( t.packages_id == s.id ) )
            @notification = Notifications.create(s.senders_id, "You should confirm the final delivery")
         end
        end
     end
    end
    return;
  end 


  #This methods should notify the carrier that sender gave him a rating on a specific package
  #Inputs: cookies[:user_id]-int
  #Returns: @notification(Notifications model)
  #Author: Youssef S.Barakat 

  def  notify_rating
    @pack = Packages.get_packages_rating(cookies[:user_id])
    if( @pack != nil )
      @pack.each do |t|
        @rating = Packages.get_packages_find_rating(t.id)
        @rate = Packages.get_packages_find_rate(t.id)
        @rates = Packages.get_packages_find_rates(t.id)
        if( @rating == true ) && ( @rates != nil )
          @notification = Notifications.create(@rate, "You have been rated on a specific package")
        end
      end
    end
    return;
  end


  #This methods should notify the sender and the carrier that an amount has been deducted from both of them when the carrier received the package from the sender and confirmed it
  #Returns: @notification(Notifications model)
  #Author: Youssef S.Barakat 

  def  notify_payment
    @pack  = Packages.get_packages_payment
    @pay = Payment.get_all_payments
    if( @pack != nil ) && ( @pay != nil )
      @pack.each do |t|
        @pay.each do |s|
          if( t.id == s.packages_id )
            if( t.senders_id == s.users_id )
              @notification = Notifications.create(t.senders_id, "as a sender an amount has been deducted from your account")
            elsif( t.carriers_id == s.users_id )
              @notification = Notifications.create(t.carriers_id, "as a carrier an amount has been deducted from your account")
            end
          end
        end
      end
    end
    return;
  end


  #This methods should notify the carrier that an amount has been deducted and another one has been transferred to him when the sender confirmed that the package was received
  #Returns: @notification(Notifications model)
  #Author: Youssef S.Barakat 

  def  notify_finalpayment
    @pack = Packages.get_packages_final_payment
    @pay = Payment.get_all_payments
    if( @pack != nil ) && ( @pay != nil )
      @pack.each do |t|
        @pay.each do |s|
          if( t.id == s.packages_id ) && ( t.carriers_id = s.users_id )
            @notification = Notifications.create(t.carriers_id, "as a carrier an amount has been added to your account and another amount has been deducted")
          end
        end
      end
    end
    return;
  end


  #This methods should notify the sender that his national id was verified
  #Inputs: cookies[:user_id]-int
  #Returns: @notification(Notifications model)
  #Author: Youssef S.Barakat 

  def  verify_id_number
    @verification = Users.get_users_verify(cookies[:user_id])
    if( @verification == true )
      @notification = Notifications.create(cookies[:user_id], "Your id is verified")
    elsif( @verification != true )
      @notification = Notifications.create(cookies[:user_id], "Your id is not verified")
    end
    return;
  end


  #This methods should notify the sender that a specific carrier accepted or rejected his request on a certain package
  #Inputs: cookies[user_id]-int
  #Returns: @notification(Notifications model)
  #Author: Youssef S.Barakat 

  def  notify_accept_reject_request
    @requests = Requests.get_requests_accept_reject(cookies[:user_id])
    @packages = Packages.get_packages_accept_reject(cookies[:user_id])
    if( @requests != nil )
      @senders_id = Array.new
      @requests.each do |t|
        sender_id = t.senders_id;
        @senders_id.push sender_id;
      end
      @senders_id.each do |s|
        @requests.each do |t|
          @packages.each do |p| 
            if( ( t.senders_id == s ) && ( t.accept !=false ) && ( t.packages_id==p.id ) )
              @notification = Notifications.create(s, "your request has been accepted")
            elsif( ( t.senders_id == s ) && ( t.accept == false ) ) 
              @notification = Notifications.create(s, "your request has been rejected")
            end
          end
        end
      end
    end
    return;
  end


  #This methods should notify the carrier that a package he has accepted to carry was deleted
  #Inputs:cookies[:user_id]-int
  #Returns:@notifications
  #Author: Youssef S.Barakat

  def  notify_delete_package
    @requests = Requests.get_requests_delete_package(cookies[:user_id])
    @packages = Packages.get_all_packages
    flag = true
    if( @requests != nil && @packages != nil )
      @packages.each do |t|
        @requests.each do |s|
          if( ( s.senders_id == cookies[:user_id] )&&( s.accept == true ) )
            @notification = Notifications.create_update( s.carriers_id )
              if( ( t.id == s.packages_id ) && ( t.senders_id == s.senders_id ) && ( t.carriers_id == s.carriers_id ) )
                @notification = Notifications.create( s.senders_id,"The package you deleted is not yet removed" )
                flag = false
              end
          end
        end
      end
      if( flag == true )
        @notification = Notifications.create_up( "The package you have accepted to carry has been removed" )
      end
    end
    return;
  end


  #This methods should notify the sender that a trip he has requested and the carrier accepted it,was deleted
  #Inputs:cookies[:user_id]-int
  #Returns:@notifications
  #Author: Youssef S.Barakat

  def  notify_delete_trip
    @requests = Requests.get_requests_delete_trip(cookies[:user_id])
    @trips = Trips.get_all_trips
    @packages = Packages.get_packages_trip(cookies[:user_id])
    flag = true
    if( @requests != nil && @trips != nil && @packages != nil )
      @packages.each do |t|
        @requests.each do |s|
          if( ( t.carriers_id == s.carriers_id ) && ( s.accept == true ) && ( t.id == s.packages_id ) )
            @notification = Notifications.create_update( s.senders_id )
            @trips.each do |n|
              if( ( n.destination == t.destination ) && ( n.users_id == t.carriers_id ) )
                @notification = Notifications.create( s.carriers_id,"The trip you deleted is not yet removed" )
                flag = false
              end
            end
          end
        end
      end
      if( flag == true )
        @notification = Notifications.create_up( "The trip you have requested has been deleted" )
      end
    end
    return;
  end


  #This methods should notify the user if there is any problem with his credit card amount
  #Returns:@notifications
  #Author: Youssef S.Barakat

  def  notify_credit_problem
    @user = Users.find_by_id( cookies[:user_id] ).creditCard
    @amount = Payment.get_payments_credit(cookies[:user_id] )
    @packages = Packages.get_all_packages
    if( @packages != nil && @amount != nil && @user != nil ) 
      @amount.each do |t|
        @packages.each do |s|
          if( t.packages_id == s.id && s.carriers_id == cookies[:user_id] || s.senders_id == cookies[:user_id] )
            @withdraw = t.amountWithdraw
            if( @withdraw != nil && @user != nil && @withdraw > @user )
              @notification = Notifications.create( cookies[:user_id],"Your credit card doesn't have enough amount to be withdrawn" )
            end
          end
        end
      end
    end
    return;
  end


  #This methods should notify one or 3 carriers if they received a request from a sender to carry a package
  #Inputs:cookies[:user_id]-int
  #Returns:@notifications
  #Author: Youssef S.Barakat

  def  notify_carriers
    @requests = Requests.get_requests_delete_package(cookies[:user_id])
    @packages = Packages.get_packages_rating(cookies[:user_id])
    if( @requests != nil && @packages != nil )
      @requests.each do |t|
        @packages.each do |s|
          if( t.packages_id == s.id && t.senders_id == s.senders_id && t.accept == nil && s.carriers_id ==nil )
            @notification = Notifications.create( t.carriers_id," You have received a request to carry a package" )
          end
        end
      end
    end
    return;
  end
end
