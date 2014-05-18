require 'spec_helper'
require 'payment'

#Author : Abdelrahman Y. Seoudy.

decribe payments do 
 it "only returns the payments if the admin is equal true and the amount transfer is inserted"
 @user1 = Users.new (admin: true)
 @user2 = Users.new (admin: false)
 @payment1 = Payments.new (amountTransfer: '12345')
 @payment2 = Payments.new 
payment_test = Payments.find_payments(user1.id)
user_test = Users.find_admin(user1.id)
expect(payment_test).to_not include @payment2
end