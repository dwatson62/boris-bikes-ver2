require 'bike'

describe Bike do
  context 'On creation' do
    it 'Bike is working' do
      bike = Bike.new
      expect(bike.working).to be_truthy
    end
  end
end