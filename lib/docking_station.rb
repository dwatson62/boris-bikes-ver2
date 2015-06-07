require 'load_file'

class DockingStation

  include BikeContainer

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

end