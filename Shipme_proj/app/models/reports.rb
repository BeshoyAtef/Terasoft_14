class Reports < ActiveRecord::Base
	belongs_to :reporter, :class_name => "Users"
	belongs_to :reported, :class_name => "Users"
	belongs_to :packages


  #This methd intends to create a new report in the database.
  #Input : Reported username -string, Description -string , Package id-int .
  #output : saves data in database.
  #Author : Mohamed A.Gheith. 
  
  def self.create_report(reporter_id,reported_username,description,package_id)
    report = Reports.new
    report.reporters_id = reporter_id 
    report.description = description
    report.packages_id = package_id
    @users=Users.find(:all)
    @users.each do |u|
     if(u.username==reported_username)
    	report.reported_id=u.id
     end	
    end
   report.save
  end
end
