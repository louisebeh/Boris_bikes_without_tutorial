class DockingStation
  DEFAULT_CAPACITY = 10


  def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @bikes = []
  end

  def dock(bike)
    raise 'Station is full' if full?
    @bikes << bike
  end

  def bike_count
    @bikes.count
  end

  def release(bike)
    @bikes.delete(bike)
  end

  def full?
    bike_count == @capacity
  end

  def available_bikes
    @bikes.reject {|bike| bike.broken? }
    #@bikes : denotes bikes within an array
    #.reject : deletes elements from the forthcoming block that evaluate to true.
    #{|bike| bike.broken? } : is an array of all broken bikes. r
    # @bikes.reject {|bike| bike.broken? } deletes broken bikes from the @bikes array thus leaving the available bikes.
  end

  def duplicate(bike)
    if @bikes.detect {|e| @bikes.count(e) > 1}
      raise 'You cannot dock the same bike twice!'
    end
  end

end


