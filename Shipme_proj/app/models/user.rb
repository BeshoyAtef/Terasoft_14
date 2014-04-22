class User < ActiveRecord::Base
	validates_length_of :mobileNumber, :minimum => 9
 validates_length_of :creditCard, :is => 19 
 validates_length_of :user_Id, :minimum => 22
	has_many :messages, :class_name => "Users", :foreign_key => "user_Id"
	has_many :notifications, :class_name => "Users", :foreign_key => "user_Id"
	has_many :packages, :class_name => "Users", :foreign_key => "user_Id"
	has_many :payment, :class_name => "Users", :foreign_key => "user_Id"
	has_many :reports, :class_name => "Users", :foreign_key => "user_Id"
	has_many :requests, :class_name => "Users", :foreign_key => "user_Id"
	has_many :trips, :class_name => "Users", :foreign_key => "user_Id"
end
