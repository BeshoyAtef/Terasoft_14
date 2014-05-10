class Messages < ActiveRecord::Base
  require 'will_paginate/array'
	belongs_to :sender, :class_name => "Users"
	belongs_to :receiver, :class_name => "Users"


def self.get_last_message(user_id) 
 @messages= Messages.find(:all, :conditions => {:receivers_id => user_id }).group_by{ |t| t.senders_id }
end

def self.get_last_message_paginated(user_id,page) 
 @messages= Messages.find(:all, :conditions => {:receivers_id => user_id }).group_by{ |t| t.senders_id }
 @messages_paginated=@messages.keys.paginate(:page => page, :per_page => 2)
end

def self.send_new_message(sender_id, receiver_username, description) 
      $flag=false
      @users = Users.find(:all)
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
       $flag=true
     end
end 

end
