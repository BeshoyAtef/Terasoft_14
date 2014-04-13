class Reports < ActiveRecord::Base
	belongs_to :reporter, :class_name => "Users", :foreign_key => "reporter_Id"
	belongs_to :reported, :class_name => "Users", :foreign_key => "reported_Id"
end
