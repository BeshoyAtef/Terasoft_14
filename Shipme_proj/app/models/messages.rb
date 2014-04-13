class Messages < ActiveRecord::Base
	belongs_to :sender, :class_name => "Users", :foreign_key => "sender_Id"
	belongs_to :receiver, :class_name => "Users", :foreign_key => "receiver_Id"
end
