class Reports < ActiveRecord::Base
	belongs_to :reporter, :class_name => "Users"
	belongs_to :reported, :class_name => "Users"
	belongs_to :packages
	

	#this methods should get all reports
    #Returns: @reports
    #Author: Youssef S.Barakat

	def self.get__all_reports 
		@reports = Reports.find(:all)
	end
end
