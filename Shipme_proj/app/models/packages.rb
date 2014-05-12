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
		Packages.group_by_month(:created_at).count
	end

end
