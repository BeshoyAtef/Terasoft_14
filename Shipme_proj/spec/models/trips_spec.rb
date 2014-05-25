require 'spec_helper'
require 'trips'
#Author: Hagar E. Aly

describe Trips do
	it 'is valid to delete trip' do
		@user = Users.new(username: 'hagar', encrypted_password: '123', email: 'hagar@hotmail.com')
		@trip1 = Trips.new(users_id: '1',destination: 'Spain', location: 'Egypt', maxWeight: '5', travelDate: '2015/08/02')
		@trip2 = Trips.new( destination: 'England', location: 'Egypt', maxWeight: '5', travelDate: '2015/08/02')
		trips = Trips.delete_trip('1')
		expected(trips).to_not include @trip2
	end
end
