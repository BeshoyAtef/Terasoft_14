require 'spec_helper'
require 'messages'

describe Messages do

#Author: Rehab A.ELshahawy
it "returns false when users don't have packages in common,
thus can't send messages" do
		@user1= Users.new(username:'rehab')
		@user2= Users.new(username:'marwa')
		@user3=Users.new(username:'micheal')
		@package=Packages.new(senders_id: @user1.id,carriers_id: @user2.id) 
		message_test=Messages.send_new_message(@user2.id,@user3.username,"hello")
		expect(message_test).to eq false
end
#Author: Rehab A.ELshahawy
it "is valid with a sender,reciever and a description" do
		@message = Messages.new
		@message.description ="hiiiii , miss you"
		@message.senders_id ='1'
		@message.receivers_id ='2'
		expect(@message).to be_valid
end

#Author: Rehab A.ELshahawy
it "is not valid without a description" do
	expect(Messages.new(description: nil)).to have(1).errors_on(:description)
end

#Author: Rehab A.ELshahawy
 it "is not valid without a sender" do
	expect(Messages.new(senders_id: nil)).to have(1).errors_on(:senders_id)
end

#Author: Rehab A.ELshahawy
 it "is not valid without a reciever" do
	expect(Messages.new(receivers_id: nil)).to have(1).errors_on(:receivers_id)
	end
end

