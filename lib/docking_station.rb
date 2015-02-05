#load BikeContainer module
require_relative 'bike_container'

class DockingStation

  #this gives us all the methods to be used in this class
  include BikeContainer


  def initialize(options = {})
    # self.capacity is calling the capacity=() method
    # (note the equals sign) defined in BikeContainer
    # capacity (the second argument to fetch()) is calling
    # the capacity() method in BikeContainer
    self.capacity = options.fetch(:capacity, capacity)
  end

  # The initializer method has been retained because we want the ability to set a custom capacity for the station.

end



