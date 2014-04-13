class Requests < ActiveRecord::Base
	belongs_to :sender, :class_name => "Users", :foreign_key => "sender_Id"
	belongs_to :carrier, :class_name => "Users", :foreign_key => "carrier_Id"
end
