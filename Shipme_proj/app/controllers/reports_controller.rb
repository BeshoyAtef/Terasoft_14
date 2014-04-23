class ReportsController < ApplicationController


  #this method is to initialize all Reports attributes to view_reports
  #all attributes
  #nothing
  #Auther:Ahmed .M Samouka

  def  index
    @view_reportes = Reports.find(:all)
  end


  #this method is to send an email via admin delevry
  #userId
  #switch to admin delevry
  #Auther : Ahmed .M Samouka

  def  sendMail
    @users = Users.find(:all)
    @users.each do |u|
    if(params[:id] == u.id)
      Admin.delivery(u.email)
    end
  end
end