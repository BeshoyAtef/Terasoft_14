require 'spec_helper'
require 'users'
describe Users do
it "returns a list of users that their name starts with the given value" do
@user1=Users.new(username: 'madeleine' )
@user2=Users.new(username: 'mado')
@user3=Users.new(username: 'madeleineAziz')
@user4=Users.new(username: 'emma')
@user5=Users.new(username: 'rehab')

search_user_test=Users.search_users_with_same_name("ma")
expect(search_user_test).to eq ["madeleine", "mado","madeleineAziz"]
end
it "returns false when users don't have packages in common,
thus can't send messages" do
		@user1=Users.new(username: 'madeleine' )
        @user2=Users.new(username: 'mado')
        @user3=Users.new(username: 'madeleineAziz')
        @user4=Users.new(username: 'emma')
        @user5=Users.new(username: 'rehab')
		search_user_test=Users.search_users_with_same_name("ma")
        expect(search_user_test).should_not include["emma", "rehab"]
end
end