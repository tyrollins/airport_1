require_relative './plane'
require_relative './weather'

class Airport

  include Weather

  DEFAULT_CAPACITY = 10

  def planes
    @planes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)
    @capacity = value
  end

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def arrival(plane)
    raise "Airport is full" if full?
    raise "Bad weather!" if stormy?
    plane.land
    planes << plane
  end

  def departure(plane)
    raise "Airport is empty" if empty?
    raise "Bad weather!" if stormy?
    plane.take_off
    @planes.delete(plane)
    
  end

  def plane_count
    planes.count 
  end

  def full?
    plane_count == capacity
  end

  def empty?
    plane_count == 0
  end

end