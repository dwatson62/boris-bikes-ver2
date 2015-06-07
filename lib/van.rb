require 'load_file'

class Van

include BikeContainer

  def collect_broken(station)
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

end