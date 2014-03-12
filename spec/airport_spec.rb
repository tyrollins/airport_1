require 'airport'

describe Airport do
  
  let (:airport) { Airport.new(:capacity => 25)}


  it "should set capacity" do
    expect(airport.capacity).to eq (25)
  end

  context "Taking off and landing" do

    it "should land" do
      plane = double :plane, land: nil

      airport.arrival(plane)
      expect(airport.planes.length).to eq(1)
    end

    it "should take off" do
      plane = double :plane, take_off: nil

      airport.arrival(plane)
      airport.departure(plane)
      expect(airport.planes.length).to eq(0)
    end
  end

  context "Traffic control" do

    it "should not land is full" do
      plane = double :plane
      airport.capacity.times {airport.arrival(plane)} 
      expect(lambda { airport.arrival(plane) }).to raise_error(RuntimeError)
    end

    it "should not take off if empty" do
      plane = double :plane
      if airport.plane_count == 0
        expect(lambda {airport.departure(plane)}).to raise_error(RuntimeError)
      end
    end
  end
end