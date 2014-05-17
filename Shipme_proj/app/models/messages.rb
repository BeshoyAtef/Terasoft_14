class Messages < ActiveRecord::Base
	belongs_to :sender, :class_name => "Users"
	belongs_to :receiver, :class_name => "Users"
  #validates :senders_id, presence: true
  #validates :receivers_id, presence: true
  #validates :description, presence: true

  #This method is showing a conversation .
  #user1_id - int, user2_id - int.
  #Returns messages_sent array.
  #Author Madeleine A. Saad.


  def self.get_conversation(user1_id, user2_id) 
  @messages_sent= Messages.find( :all,:conditions => ["senders_id = ? and 
    receivers_id = ? or senders_id = ? and receivers_id = ? ",
    user1_id,user2_id,user2_id,user1_id],:order => 'created_at' )
  end 
  
  
  #This method adds a message in table messages.
  #user1_id - int, user2_id - int, description - string.
  #Author Madeleine A. Saad.
 
  def self.send_message(user1_id, user2_id, description)
   @msg = Messages.new( :receivers_id => user1_id,:senders_id => user2_id, 
    :description => description ) 
   @msg.save 
  end
  

  #This method gets the last message recieved from each sender,and groups them by the sender's id
  #Input: user_id-int
  #Return: @messages-array of messages
  #Author: Rehab A.Elshahawy

  def self.get_last_message( user_id ) 
      @messages= Messages.find( :all, :conditions => {:receivers_id => user_id }).group_by{ |t| t.senders_id }
  end


  #This method sends new messages,but first it calls the method get_package_messages to make sure that the sender and the reciever can have a conversation,it also loops on table users to find the id that corresponds to the receiver_username and insert it in the database
  #Input: sender_id,receiver_username,description-int
  #Return: $flag-boolean which tells if the record is inserted or not
  #Author: Rehab A.Elshahawy

  def self.send_new_message(sender_id, receiver_username, description) 
      @flag=nil
      @users = Users.find( :all )
      @users.each do |u|
        if(u.username == receiver_username)
          $receiver_id =u.id
        end 
      end
      @packages=Packages.get_package_messages(sender_id,$receiver_id)
      if(@packages.first() != nil)
        message = Messages.new
        message.senders_id = sender_id
        message.description=description
        message.receivers_id =$receiver_id
        message.save
        @flag=true
      elsif (@packages.first() == nil)
        @flag=false
      end
      return @flag
  end 

end

