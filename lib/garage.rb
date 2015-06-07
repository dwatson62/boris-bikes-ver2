class Garage

  attr_accessor :bikes
  attr_reader :capacity

  DEFAULT_CAPACITY = 4

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def receive_bikes(van)
    van.bikes.each { |bike| @bikes << bike }
    van.unload
  end

  def fix_all
    is_empty?
    bikes.each { |bike| bike.working = true }
  end

  def is_empty?
    raise 'No bikes to fix' if bikes.empty?
  end

  def return_bikes
    @bikes = []
  end

end