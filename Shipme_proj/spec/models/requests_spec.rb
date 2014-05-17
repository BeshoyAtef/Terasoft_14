require 'spec_helper'
require 'requests'

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