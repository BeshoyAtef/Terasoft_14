require 'spec_helper'
require 'requests'
require 'users'
require 'packages'

describe Requests do 
  it "allows carrier to cancel request" do
     @sender=Users.new(username: 'Hassan')
     @carrier=Users.new(username: 'khairy')
     @package=Packages.new(senders_id: @sender.id,carriers_id: @carrier.id,destination: "cairo", receivedByCarrier: 'false')
     request=Requests.new(carriers_id: @carrier.id,senders_id: @sender.id,packages_id: @package.id,accept: 'true')
    Requests.cancel_request(request.id)
    
    expect(request.accept).to eq false
  end
  it "doesn't allow carrier to cancel request if he received the package" do
    sender=Users.new(username: 'Hassan', email: '5o5a@hotmail.com')
    carrier=Users.new(username: 'khairy', email: '5o5a@hotmail.com')
    package=Packages.new(destination: 'cairo', receivedByCarrier: 'true', carriers_id: carrier.id, senders_id: sender.id)
   request=Requests.new(carriers_id: carrier.id,senders_id: sender.id,packages_id: package.id,accept: 'true')
    Requests.cancel_request(request.id)
    
    expect(request.accept).to eq true
  end
   it "sender will be notified if carrier cancel the request" do
    sender=Users.new(username: "Hassan")
    carrier=Users.new(username: "khairy")
    package=Packages.new(destination: "cairo", receivedByCarrier: false)
    request=Requests.new(carriers_id: carrier.id,senders_id: sender.id,packages_id: package.id,accept: true)
    notification_returned=Requests.cancel_request(request.id)
    notification=Notifications.new(users_id: sender.id, description:  sender.username+" "+"canceled your accepted request")
    expect( notification_returned.users_id).to eq notification.users_id
    expect( notification_returned.description).to eq notification.description
  end


#Author: Manar A. Eltayeb.

describe Requests do

it "request is send and saved in the database" do
first_request = Requests.new(accept: 'null' , carriers_id: '24', senders_id: '21',packages_id: '51')
second_request = Requests.new(accept: 'null', carriers_id:'26', senders_id: '21' ,packages_id: '51')
third_request = Requests.new(accept: 'null', carriers_id: '25', senders_id: '21' ,packages_id: '51')
fourth_request = Requests.new(accept: 'null', carriers_id: '27', senders_id: '21' ,packages_id: '51')

expect(Requests.send_requests('27' ,'21', '51')).to eq(true)
expect(Requests.send_requests('26' ,'21', '51')).to eq(true)
expect(Requests.send_requests('25' ,'21', '51')).to eq(true)
expect(Requests.send_requests('24' ,'21', '51')).to eq(nil)
end

end