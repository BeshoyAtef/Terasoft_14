class SendSmsController < ApplicationController
require 'twilio-ruby'

  #this method is made to send sms, by taking 2 inputs the method first intialize the connection with twillio then create sms using the inputs  
  #Input: number string , text string.
  #Returns: sends a sms.
  #Author: Omar A. Abdel-fatah.

  def self.send_sms( number,text )
    account_sid = "AC9ec4b58090b478bc49c58aa6f3644cc7"
    auth_token = "79ba8ebb0bf8377302f735f853cd7006"
    client = Twilio::REST::Client.new account_sid, auth_token
    from = "+18587369892" # Your Twilio number
    client.account.messages.create(
    :from => from,
    :to => number,
    :body => text
    ) 
  end


  #this method view the sms 
  #Author: Omar A. Abdel-fatah

  def  message
  end


  #this method test the sending sms with the given number
  #Author: Omar A. Abdel-fatah

  def  test
    send_sms( "+20126699638","Hey, Welcome to Shipme Website ;)" )
  end
end
