class Requests < ActiveRecord::Base
	belongs_to :sender, :class_name => "Users"
	belongs_to :carrier, :class_name => "Users"
	belongs_to :packages
end
