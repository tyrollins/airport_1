require 'airport'

describe Airport do
  
  let (:airport) { Airport.new(:capacity => 25)}


  it "should set capacity" do
    expect(airport.capacity).to eq (25)
  end

  context "Taking off and landing in good weather" do
    before do
        airport.stub(:stormy?).and_return(false)
    end
    it "should land" do
      plane = Plane.new

      airport.arrival(plane)
      expect(airport.planes.length).to eq(1)
      expect(plane.flying?).to eq(false)
    end

    it "should take off" do
      plane = Plane.new
      airport.arrival(plane)
      airport.departure(plane)
      expect(airport.planes.length).to eq(0)
      expect(plane.flying?).to eq(true)
    end
  end
  context "Take off / Landing bad weather" do
    let (:plane) {Plane.new}
    
    it "should not take off in bad weather" do
      airport.stub(:stormy?).and_return(false)
      airport.arrival(plane)
      airport.stub(:stormy?).and_return(true)
      expect(lambda { airport.departure(plane) }).to raise_error(RuntimeError)
    end

    it "should not land in bad weather" do
      airport.stub(:stormy?).and_return(true)
      expect(lambda { airport.arrival(plane) }).to raise_error(RuntimeError)
    end
  end

  context "Traffic control" do
    before do
      airport.stub(:stormy?).and_return(false)
    end
    it "should not land is full" do
      plane = Plane.new
      airport.capacity.times {airport.arrival(plane)} 
      expect(lambda { airport.arrival(plane) }).to raise_error(RuntimeError)
    end

    it "should not take off if empty" do
      plane = Plane.new
      if airport.plane_count == 0
        expect(lambda {airport.departure(plane)}).to raise_error(RuntimeError)
      end
    end
  end
end


