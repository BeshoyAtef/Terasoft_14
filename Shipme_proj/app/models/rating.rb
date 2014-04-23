class Rating < ActiveRecord::Base
  #belongs_to :user
  belongs_to :package, class_name => 'packages'

  belongs_to :rater, :class_name => "users"
  belongs_to :rateable, :polymorphic => true
  
  attr_accessible :rate, :score
end
