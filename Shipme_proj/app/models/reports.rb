class Reports < ActiveRecord::Base
	belongs_to :reporter, :class_name => "Users"
	belongs_to :reported, :class_name => "Users"
	belongs_to :packages
end
