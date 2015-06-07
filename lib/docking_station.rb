class DockingStation

  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def add_bike(bike)
    @bikes << bike
  end

  def release_bike
    bikes.each do |bike|
      if bike.working
        bikes.delete(bike)
        return bike
      end
    end
  end

end