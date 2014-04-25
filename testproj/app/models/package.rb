class Package < ActiveRecord::Base
  belongs_to :senders
  seems_rateable :allow_update => true, :dimensions => [:quality, :length]
end
