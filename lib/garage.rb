require 'load_file'

class Garage

  include BikeContainer

  def fix_all
    is_empty?
    bikes.each { |bike| bike.working = true }
  end

end