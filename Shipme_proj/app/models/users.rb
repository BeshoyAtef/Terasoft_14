class Users < ActiveRecord::Base
	has_many :messages, :class_name => "Users", :foreign_key => "user_Id"
	has_many :notifications, :class_name => "Users", :foreign_key => "user_Id"
	has_many :packages, :class_name => "Users", :foreign_key => "user_Id"
	has_many :payment, :class_name => "Users", :foreign_key => "user_Id"
	has_many :reports, :class_name => "Users", :foreign_key => "user_Id"
	has_many :requests, :class_name => "Users", :foreign_key => "user_Id"
	has_many :trips, :class_name => "Users", :foreign_key => "user_Id"

	has_many :ratings
    has_many :packages

    ajaxful_rateable :scores => [:behavior]
  	ajaxful_rater
end
