class AddTrip < ActiveRecord::Base
scope :match, lambda {|destination,location| 
		where(:Destination => destination, :Location => location)}
end
