class PrecautionsMail < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.precautions_mail.precaution.subject
  #
  def precaution
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
