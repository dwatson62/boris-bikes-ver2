describe Van do
  context 'Upon creation' do
    it 'is empty' do
      expect(subject.bikes.length).to eq 0
    end
    it 'has a capacity of 4' do
      expect(subject.capacity).to eq 4
    end
  end

  context 'Can collect from the stations' do
    it 'only broken bikes' do
      bike1 = Bike.new
      bike1.break
      station = DockingStation.new
      station.add_bike(bike1)
      3.times { station.add_bike(Bike.new) }
      subject.collect(station)
      expect(subject.bikes.length).to eq 1
    end
    it 'and reports if there are no broken bikes' do
      station = DockingStation.new
      3.times { station.add_bike(Bike.new) }
      expect { subject.collect(station) }.to raise_error 'No broken bikes'
    end
  end

  context 'Can unload' do
    it 'broken bikes at the garage' do
      station = DockingStation.new
      3.times do
        bike = Bike.new
        bike.break
        station.add_bike(bike)
      end
      subject.collect(station)
      subject.unload
      expect(subject.bikes).to eq []
    end
    it 'working bikes at the station' do
      3.times { subject.bikes << Bike.new }
      station = DockingStation.new
      station.load(subject)
      expect(subject.bikes).to eq []
    end
  end

  context 'Can load working bikes' do
    it 'that have been fixed in the garage' do
      garage = Garage.new
      3.times do
        bike = Bike.new
        bike.break
        garage.bikes << bike
      end
      garage.fix_all
      subject.load(garage)
      expect(subject.bikes.length).to eq 3
    end
  end

  context 'Cannot unload' do
    it 'if van is empty' do
      expect { subject.unload }.to raise_error 'Van is empty'
    end
  end
end