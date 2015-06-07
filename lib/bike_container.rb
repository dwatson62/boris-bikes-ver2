module BikeContainer

  attr_accessor :bikes
  attr_reader :capacity

  DEFAULT_CAPACITY = 4

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def is_empty?
    raise "#{self.class.name} is empty" if bikes.empty?
  end

  def is_full?
    raise "#{self.class.name} is full" if bikes.length == capacity
  end

  def unload
    is_empty?
    @bikes = []
  end

  def load_from(container)
    container.bikes.each do |bike|
      is_full?
      @bikes << bike
    end
    container.unload
  end

end