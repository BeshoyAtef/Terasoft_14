class Trips < ActiveRecord::Base
	belongs_to :users
	require "will_paginate/array"

def self.get_trips(user_id,page)
 @trips=Trips.find(:all , :conditions => {:users_id => user_id})
 @trips=@trips.paginate(:page => page, :per_page => 1)
end

end
