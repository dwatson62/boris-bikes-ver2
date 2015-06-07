class DockingStation

  attr_accessor :bikes
  attr_reader :capacity

  DEFAULT_CAPACITY = 4

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def add_bike(bike)
    raise 'Station is full' if bikes.length == capacity
    @bikes << bike
  end

  def release_bike
    is_empty?
    bikes.each do |bike|
      if bike.working
        bikes.delete(bike)
        return bike
      end
    end
    raise 'No bikes available'
  end

  def is_empty?
    raise 'No bikes available' if bikes.empty?
  end

end