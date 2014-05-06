class Packages < ActiveRecord::Base

	belongs_to :sender, :class_name => "Users"
	belongs_to :carrier, :class_name => "Users"
	has_many :payment
	has_one :reports
	has_many :requests

	def self.view_shipments
	  @packages = Packages.find( :all, :conditions => {:finalDelivery => true}, :order => "created_at ASC" )
    end

end
