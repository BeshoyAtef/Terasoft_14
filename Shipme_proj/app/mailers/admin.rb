class Admin < ActionMailer::Base
  default from: "joe.ghali0@gmail.com"

 def forgot_mail(mail)
 	@conf = "mail not found"
 	@var = Users.find(:all)
 	@var.each do |v|
 	if v.email   = mail
  	  recipients = "joe.ghali0@gmail.com"
	  from       = v.email
	  subject    = "your password"
	  body 	     = v.encrypted_password
	  @conf      = "mail is sent"
  	end
 end
end
end