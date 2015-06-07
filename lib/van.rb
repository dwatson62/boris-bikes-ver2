class Van

  attr_accessor :bikes
  attr_reader :capacity

  DEFAULT_CAPACITY = 4

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def collect(station)
    check_station(station)
    station.bikes.each do |bike|
      if bike.working == false
        @bikes << bike
        station.bikes.delete(bike)
      end
    end
  end

  def check_station(station)
    station.bikes.each do |bike|
      return if bike.working == false
    end
    raise 'No broken bikes'
  end

  def unload
    is_empty?
    @bikes = []
  end

  def load(garage)
    garage.bikes.each { |bike| @bikes << bike if bike.working }
    garage.return_bikes
  end

  def is_empty?
    raise 'Van is empty' if @bikes.empty?
  end

end