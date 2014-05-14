class Packages < ActiveRecord::Base

  require 'rubygems'
  require 'googlecharts'
  require 'gchart'

	belongs_to :sender, :class_name => "Users"
	belongs_to :carrier, :class_name => "Users"
	has_many :payment
	has_one :reports
	has_many :requests


	def self.generate_shipments_graph

	@packages = Packages.find( :all, :conditions => {:finalDelivery => true} )
	@packages_months = @packages.group_by { |package| package.created_at}
  @package_count =@packages_months.count

	end




end
