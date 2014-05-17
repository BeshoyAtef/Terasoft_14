require 'spec_helper'
require 'notifications'

describe Notifications do
it 'is valid Send a notification' do
	user = Users.new( email: 'barakat@hotmail.com', username: 'barakat', encrypted_password: 'hello', mobileNumber: 0100500 )
	user2 = Users.new( email: 'youssef@hotmail.com', username: 'youssef', encrypted_password: 'hello', mobileNumber: 0100500 )
	package = Packages.new( carriers_id: user.id, senders_id: user2.id, destination: 'Spain' )
	request = Requests.new( carriers_id: user.id, senders_id: user2.id, accept: true, packages_id: package.id )
	notification = Notifications.new( users_id: user.id, description: 'The package you have accepted to carry has been removed' )
	Notifications.notify_delete_package(user2.id)
	expect(notification).to be_valid
end
end


describe Notifications do
it 'is valid Send a notification' do
	user = Users.new( email: 'barakat@hotmail.com', username: 'barakat', encrypted_password: 'hello', mobileNumber: 0100500 )
	user2 = Users.new( email: 'youssef@hotmail.com', username: 'youssef', encrypted_password: 'hello', mobileNumber: 0100500 )
	package = Packages.new( carriers_id: user.id, senders_id: user2.id, destination: 'Spain' )
	trip = Trips.new( users_id: user.id, destination: 'Egypt' )
	request = Requests.new( carriers_id: user.id, senders_id: user2.id, packages_id: package.id, accept: true)
	notification = Notifications.new( users_id: user2.id, description: "The trip you have requested has been deleted" )
	Notifications.notify_delete_trip(user.id)
	expect(notification).to be_valid
end
end


describe Notifications do
it 'is valid Send a notification' do
	user = Users.new( email: 'barakat@hotmail.com', username: 'barakat', encrypted_password: 'hello', mobileNumber: 0100500, creditCard: 50 )
	user2 = Users.new( email: 'youssef@hotmail.com', username: 'youssef', encrypted_password: 'hello', mobileNumber: 0100500 )
	package = Packages.new( carriers_id: user.id, senders_id: user2.id, destination: 'Spain' )
	payment = Payment.new( users_id: user.id, amountWithdraw: 100, packages_id: package.id )
	notification = Notifications.new( users_id: user.id, description: "Your credit card doesn't have enough amount to be withdrawn" )
	Notifications.notify_credit_problem(user.id)
	expect(notification).to be_valid
end
end



describe Notifications do
it 'is valid Send a notification' do
	user = Users.new( email: 'barakat@hotmail.com', username: 'barakat', encrypted_password: 'hello', creditCard: 50)
	user2 = Users.new( email: 'youssef@hotmail.com', username: 'youssef', encrypted_password: 'hello', mobileNumber: 0100500 )
	package = Packages.new( carriers_id: nil, senders_id: user2.id, destination: 'Spain' )
	request = Requests.new( carriers_id: user.id, packages_id: package.id, senders_id: user2.id, accept: nil)
	notification = Notifications.new( users_id: user.id, description: " You have received a request to carry a package" )
	Notifications.notify_carriers(user.id)
	expect(notification).to be_valid
end
end