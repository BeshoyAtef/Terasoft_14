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
 

it "is vaild when it list the ids equal to null" do
smith = Users.new(username: 'smith', encrypted_password: '1221212',
email: 'jsmith@example.com', mobileNumber: '112222', admin: 'null' , idNumber: '12234455', idVerify: 'null', averageRating: '122', creditCard: '122', creditCardNumber: '1333333333')
samo = Users.new(username: 'smith', encrypted_password: '1221212',
email: 'jsmith@example.com', mobileNumber: '112222', admin: 'null' , idNumber: '156', idVerify: 'null', averageRating: '122', creditCard: '122', creditCardNumber: '1333333333')
lolo = Users.new(username: 'smith', encrypted_password: '1221212',
email: 'jsmith@example.com', mobileNumber: '112222', admin: 'null' , idNumber: '156', idVerify: 'false', averageRating: '122', creditCard: '122', creditCardNumber: '1333333333')
koko = Users.new(username: 'smith', encrypted_password: '1221212',
email: 'jsmith@example.com', mobileNumber: '112222', admin: 'null' , idNumber: '12234455', idVerify: 'true', averageRating: '122', creditCard: '122', creditCardNumber: '1333333333')
expect(Users.verify_id) == [12234455,156]
end

end