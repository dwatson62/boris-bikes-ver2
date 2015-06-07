require 'docking_station'
require 'bike'

describe DockingStation do

  it 'Is empty upon creation' do
    expect(subject.bikes).to eq []
  end

  context 'can receive' do
    it 'a working bike' do
      bike = Bike.new
      subject.add_bike(bike)
      expect(subject.bikes).to eq [bike]
    end
    it 'a broken bike' do
      bike = Bike.new
      bike.break
      subject.add_bike(bike)
      expect(bike.working).to be_falsey
    end
  end

  context 'Member of the public accesses the station and it' do

    it 'releases a working bike' do
      subject.add_bike(Bike.new)
      bike = subject.release_bike
      expect(bike.working).to be_truthy
    end
    it 'releases one working bike at a time' do
      5.times { subject.add_bike(Bike.new) }
      subject.release_bike
      expect(subject.bikes.length).to eq 4
    end
    it 'does not release the broken bike' do
      subject.add_bike(Bike.new)
      bike2 = Bike.new
      bike2.break
      subject.add_bike(bike2)
      bike = subject.release_bike
      expect(bike.working).to be_truthy
    end
  end
end