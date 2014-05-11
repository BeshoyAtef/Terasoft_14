class Packages < ActiveRecord::Base
	require 'will_paginate/array'

	belongs_to :sender, :class_name => "Users"
	belongs_to :carrier, :class_name => "Users"
	has_many :payment
	has_one :reports
	has_many :requests

 
	def self.view_shipments_paginated(page)

	  @packages = Packages.find( :all, :conditions => {:finalDelivery => true}, :order => "created_at ASC" )
	  @packages = @packages.paginate( :page => page , :per_page => 10 ) 

	end

	def self.generate_shipments_graph
		Packages.group_by_month(:created_at).count
	end

    
end
