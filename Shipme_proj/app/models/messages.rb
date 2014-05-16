class Messages < ActiveRecord::Base
  belongs_to :sender, :class_name => "Users"
  belongs_to :receiver, :class_name => "Users"


#This method is showing a conversation .
#user1_id - int, user2_id - int.
#Returns messages_sent array.
#Author Madeleine A. Saad.

  def self.get_conversation(user1_id, user2_id) 
  @messages_sent= Messages.find(:all,:conditions => ["senders_id = ? and 
    receivers_id = ? or senders_id = ? and receivers_id = ? ",
    user1_id,user2_id,user2_id,user1_id],:order => 'created_at' )
     end 
  
  
#This method adds a message in table messages.
#user1_id - int, user2_id - int, description - string.
#Author Madeleine A. Saad.

  def self.send_message(user1_id, user2_id, description)
   @msg = Messages.new(:receivers_id => user1_id,:senders_id => user2_id, 
    :description => description) 
   @msg.save end
  end
