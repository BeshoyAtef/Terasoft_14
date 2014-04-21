class Packages < ActiveRecord::Base
	belongs_to :sender, :class_name => "Users", :foreign_key => "sender_Id"
	belongs_to :carrier, :class_name => "Users", :foreign_key => "carrier_Id"
	has_many :payment, :class_name => "Packages", :foreign_key => "package_Id"
	has_one :reports, :class_name => "Packages", :foreign_key => "package_Id"

  
 
end
