class AcceptanceMail < ActionMailer::Base
  default from: "shipmememe@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.acceptance_mail.notifier.subject
  #
  def notifier(email)
    @greeting = "Welcome To Ship-Me!"
    mail to: email, subject: "Your Request Accepted By The Carrier!"
  end
end
