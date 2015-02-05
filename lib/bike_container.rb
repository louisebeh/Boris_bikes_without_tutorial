module BikeContainer

# A module differs from a class in that it cannot be instantiated i.e. you cannot do BikeContainer.New

# Created "accessor" methods for @bikes and @capacity instance variables. This enables us to avoid working directly with the instance variables, thus 'encapsulating' the implementation inside the module. Becuase of this change, all other methods now use the accessor methods instead of manipulating hte instance variables directly.

  DEFAULT_CAPACITY = 10

  def bikes
    @bikes||=[]
  end

  def capacity
    @capacity||=DEFAULT_CAPACITY
  end

  def capacity=(value)
    @capacity = value
  end

  def bike_count
    bikes.count #bikes refers to the accessor method bikes() that is defined above.
  end

  def dock(bike)
    raise 'Holder is full' if full?
    bikes << bike
  end

  def release(bike)
    bikes.delete(bike)
  end

  def full?
    bike_count == capacity #refers to the accessor method capacity() that is defined above.
  end

  def available_bikes
    bikes.reject {|bike| bike.broken? }
  end


end

