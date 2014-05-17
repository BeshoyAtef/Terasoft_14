class Configurations < ActiveRecord::Base

  #This method enter the comission value received from the controller into the database.
  #Input: comission-int.
  #Author : Ahmed T. Mohamed.

  def self.create (comission)
    @configurations  = Configurations.new( comission )
    @configurations.save
  end   

    validates_presence_of :comission, :message => "must be provided"
    validates :comission, numericality: { only_integer: true }
end
