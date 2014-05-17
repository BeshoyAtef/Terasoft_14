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
end