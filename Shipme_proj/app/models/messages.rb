class Messages < ActiveRecord::Base
	belongs_to :sender, :class_name => "Users"
	belongs_to :receiver, :class_name => "Users"


  def self.get_last_message(user_id) 
  @messages= Messages.find(:all, :conditions => {:receivers_id => user_id }).group_by{ |t| t.senders_id }
  end

  def self.send_new_message(sender_id, receiver_username, description) 
	  message = Messages.new
      message.senders_id = sender_id
      @users = Users.find(:all)
      @users.each do |u|
        if(u.username == receiver_username)
          message.receivers_id =u.id
        end
      end

      message.description=description
      message.save
  end 


#This method gets the conversation between the user signed in and another user 
#Input params[:receivers_id, :sender_id]
#Returns @messages_sent[Messages]
#Author Madeleine Aziz Saad

  def self.get_conversation(user1_id, user2_id) 
	@messages_sent= Messages.find(:all,:conditions => ["senders_id = ? and 
		receivers_id = ? or senders_id = ? and receivers_id = ? ",
		user1_id,user2_id,user2_id,user1_id],:order => 'created_at' )
		 end 
	
#This method adds a message in table messages
#Input params[:receivers_id, :sender_id, :description]
#Returns @msg[Messages]
#Author Madeleine Aziz Saad

  def self.send_message(user1_id, user2_id, description)
	 @msg = Messages.new(:receivers_id => user1_id,:senders_id => user2_id, 
	 	:description => description) 
	 @msg.save end
  end
