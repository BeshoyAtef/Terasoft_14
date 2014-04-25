class Admin < ActionMailer::Base
  default from: "ahmed.samouka@gmail.com"


  #this method is to send email to user
  #user email
  #send email
  #Auther: Ahmed .M Samouka
  
  def delivery(user)
		recipients = user
	  from = "ahmed.samouka@gmail.com"
	  subject = "please confirm the final delivery"
	  body = "you did not confirm the final delevry and the carrier have reported you,please confirm or disconfirm as soon as possible.thank you " 
	                      
   end
end
