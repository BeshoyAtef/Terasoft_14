class Notifications < ActiveRecord::Base
	belongs_to :users


	# This method creates a new notification with it's user's id.
  # user_id - int.
  # Returns - notification.
  # Author: Youssef A. Saleh.

	def  self.set_notification(user_id)
		notification = Notifications.new
		notification.users_id = user_id
		return notification
	end


	# This method sets the description of a certain notification.
  # notification - notification, description, string.
  # Author: Youssef A. Saleh.

	def  self.create_notification_trip(notification, description)
		notification.description = description
		notification.save
	end


  #This methods should create in the notifications model
  #Inputs: cookies[user_id], description
  #Author: Youssef S.Barakat

  def  self.create( user_id,description )
	  @notification = Notifications.new
	  @notification.users_id = user_id
	  @notification.description = description
	  @notification.save
  end


  #This methods should create in the notifications model
  #Inputs: cookies[user_id]
  #Author: Youssef S.Barakat

	def  self.create_update( user_id )
		@notification = Notifications.new
	  @notification.users_id = user_id
  end


  #This methods should create in the notifications model
  #Inputs: description
  #Author: Youssef S.Barakat

  def  self.create_up( description )
    if (description != nil)
   	@notification.description = description
		@notification.save
    end
	end
	

  #This methods should get all notifications in notifications model
  #Inputs: cookies[user_id]
  #Returns: @notifications
  #Author: Youssef S.Barakat

	def  self.get_notifications( user_id )
		@notifications = Notifications.find( :all, :conditions => {:users_id => user_id} )
	end


	def  self.notify_delete_package( user_id)
    @requests = Requests.find( :all, :conditions => {:senders_id => user_id} )
    @packages = Packages.find( :all )
    flag = true
    if( @requests != nil && @packages != nil )
      @packages.each do |t|
        @requests.each do |s|
          if( ( s.senders_id == user_id )&&( s.accept == true ) && ( t.id != s.packages_id ) && ( t.senders_id == s.senders_id ) && ( t.carriers_id == s.carriers_id ) )
            @notification = Notifications.new
            @notification.users_id = s.carriers_id
            @notification.description = "The package you have accepted to carry has been removed"
            @notification.save
          if( ( t.id == s.packages_id ) && ( t.senders_id == s.senders_id ) && ( t.carriers_id == s.carriers_id ) )
            @notification = Notifications.create( s.senders_id,"The package you deleted is not yet removed" )
                flag = false
              end
          end
        end
      end
    end
    return;
  end


  #This methods should notify the sender that a trip he has requested and the carrier accepted it,was deleted
  #Inputs:cookies[:user_id]
  #Returns:@notifications
  #Author: Youssef S.Barakat

  def  self.notify_delete_trip( user_id )
    @requests = Requests.find( :all, :conditions => {:carriers_id => user_id} )
    @trips = Trips.find( :all )
    @packages = Packages.find( :all, :conditions => {:carriers_id => user_id} )
    flag = true
    if( @requests != nil && @trips != nil && @packages != nil )
      @packages.each do |t|
        @requests.each do |s|
          @trips.each do |n|
          if( ( t.carriers_id == s.carriers_id ) && ( n.destination != t.destination ) && ( n.users_id == t.carriers_id ) && ( s.accept == true ) && ( t.id == s.packages_id ) )
            @notification = Notifications.new
            @notification.users_id = s.senders_id
            @notification.description = "The trip you have requested has been deleted"
            @notification.save
          if( ( n.destination == t.destination ) && ( n.users_id == t.carriers_id ) )
            @notification = Notifications.create( s.carriers_id,"The trip you deleted is not yet removed" )
            flag = false
              end
            end
          end
        end
      end
    end
    return;
  end


  #This methods should notify the user if there is any problem with his credit card amount
  #Returns:@notifications
  #Author: Youssef S.Barakat

  def  self.notify_credit_problem( user_id )
    @users = Users.get_users_credit( user_id )
    @users.each do |t|
      @user = t.creditCard
      @amount = Payment.find( :all, :conditions => {:users_id => user_id } )
      @packages = Packages.find( :all )
      if( @packages != nil && @amount != nil && @user != nil ) 
        @amount.each do |t|
          @packages.each do |s|
            if( t.packages_id == s.id && s.carriers_id == cookies[:user_id] || s.senders_id == cookies[:user_id] )
              @withdraw = t.amountWithdraw
              if( @withdraw != nil && @user != nil && @withdraw > @user )
                @notification = Notifications.create( user_id,"Your credit card doesn't have enough amount to be withdrawn" )
              end
            end
          end
        end
      end
    end
    return;
  end


  #This methods should notify one or 3 carriers if they received a request from a sender to carry a package
  #Inputs:cookies[:user_id]
  #Returns:@notifications
  #Author: Youssef S.Barakat

  def  self.notify_carriers( user_id )
    @requests = Requests.find( :all, :conditions => {:senders_id => user_id } )
    @packages = Packages.find( :all, :conditions => {:senders_id => user_id } )
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