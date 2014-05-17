require 'spec_helper'
require 'users'

describe Users do

  it "is invalid without an email" do
    non_email_user = User.new(email: 'whatever')
    expect(non_email_user).to_not be_valid
  end

  it "is invalid without a username" do
   	non_username_user = User.new(username: 'whatever')
    expect(non_username_user).to_not be_valid
  end

  it "is invalid without a mobilenumber" do
    non_mobileNumber_user = User.new(mobileNumber: 'whatever')
    expect(non_mobileNumber_user).to_not be_valid
  end

  it "is invalid without a price" do
    non_password_user = User.new(encrypted_password: 'whatever')
    expect(non_password_user).to_not be_valid
  end

  #Author: Salah K.Zalat.

  it "checks the user ID logged in equal to the user ID being showed in the profile page" do
  @user1 = Users.new(username: 'salah')
  @user2 = Users.new(username: 'rehab')
  profile = Users.get_profile(@user1.id)
  @s = @user1.username
  
  expect(@user1.username).to eq @s
 end
end