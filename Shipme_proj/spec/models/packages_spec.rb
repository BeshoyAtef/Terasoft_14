require 'spec_helper'
require 'packages'
require 'requests'

describe Packages do
   it "is not allowed if request is accepted" do
    user = Users.new( username: 'I am a user bas gamed')
    carrying_user = Users.new(username: 'zagel')
    valid_package = Packages.new(description: 'My package',
  origin: 'origin',
  destination: 'hena aho',
  packageValue: 6,
  expiryDate: '02/02/2020',
  carryingPrice: '123',
  receiverAddress: 'gam3et el dewal awy',
  receiverMobNumber: '01010101',
  receiverEmail: 'myEmail@gmail.com',
  weight: '7',
  senders_id: user.id)
    after_edit_package = Packages.new( description: 'ay package',
  origin: 'masr',
  destination: 'she5 zayed',
  packageValue: 2,
  expiryDate: '01/01/2010',
  carryingPrice: '122',
  receiverAddress: 'gam3et el dewal awy',
  receiverMobNumber: '01010101',
  receiverEmail: 'myEmail@gmail.com',
  weight: '7',
  senders_id: user.id 
  )
  request = Requests.new(accept: 'true', senders_id: user.id, carriers_id: carrying_user.id, packages_id: valid_package.id)
    @case = Packages.edit_the_package(request.accept, valid_package,after_edit_package.destination, after_edit_package.description, after_edit_package.origin, after_edit_package.packageValue, after_edit_package.expiryDate, after_edit_package.carryingPrice, after_edit_package.receiverAddress, after_edit_package.receiverMobNumber, after_edit_package.receiverEmail, after_edit_package.weight, after_edit_package.senders_id )
    expect(@case).to eq false
  end
   
  it "is invalid without a destination" do
    non_destinated_package = Packages.new(origin: 'whatever')
    expect(non_destinated_package).to_not be_valid
  end

  it "is invalid without a description" do
   	non_descriped_package = Packages.new(origin: 'whatever')
    expect(non_descriped_package).to_not be_valid
  end

  it "is invalid without an origin" do
    non_origined_package = Packages.new(destination: 'whatever')
    expect(non_origined_package).to_not be_valid
  end

  it "is invalid without a price" do
    non_priced_package = Packages.new(destination: 'whatever')
    expect(non_priced_package).to_not be_valid
  end

  it "is invalid without an expiry date" do
    non_priced_package = Packages.new(destination: 'whatever')
    expect(non_priced_package).to_not be_valid
  end

  it "is invalid without a package value" do
    non_valued_package = Packages.new(destination: 'whatever')
    expect(non_valued_package).to_not be_valid
  end

  it "is invalid without a receiver mobile" do
    non_mobile_package = Packages.new(destination: 'whatever')
    expect(non_mobile_package).to_not be_valid
  end

  it "is invalid without a sender" do
    non_belong_package = Packages.new(destination: 'whatever')
    expect(non_belong_package).to_not be_valid
  end

  it "is invalid without a weight" do
    non_weighted_package = Packages.new(destination: 'whatever')
    expect(non_weighted_package).to_not be_valid
  end
    
#Author: Rehab A.Elshahawy
it "only returns the packages the two users have in common,
    other packages are not included" do
  @package1=Packages.new(destination:'cairo',senders_id:'1',carriers_id:'5')
  @package2=Packages.new(destination:'cairo',senders_id:'1',carriers_id:'2')
  package_test=Packages.get_package_messages('1','2')
  expect(package_test).to_not include @package1
  
end

#Author: Ahmed H.Nasser
it "Returns the package if only the user id is equal to sender id and final delivery is false" do
@user = Users.new(username:'ahmed',encrypted_password:'1234')
@package1 = Packages.new(finalDelivery: false,senders_id: @user.id)
@package2 = Packages.new(finalDelivery: false,senders_id: '10')
package_test = Packages.confirm_finaldelivery(@user.id)
expect(package_test).to_not include @package2
end

#Author: Rana M.Elbrishy.
it "should count the packages per month " do 
  package = Packages.new(description: "laptop", finalDelivery: 'true')
  package = Packages.new(description: "pens", finalDelivery: 'true')
  package_count = Packages.generate_shipments_graph
  expect(package_count == 2)
  end
end
