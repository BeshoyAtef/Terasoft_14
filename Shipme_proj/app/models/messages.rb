class Messages < ActiveRecord::Base
	belongs_to :sender, :class_name => "Users"
	belongs_to :receiver, :class_name => "Users"
end
