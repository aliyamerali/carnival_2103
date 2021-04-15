require './lib/ride'
require './lib/attendee'
require './lib/carnival'

RSpec.describe Carnival do
  describe '#initialize' do
    jeffco_fair = Carnival.new("Jefferson County Fair")

    it 'exists' do
      expect(jeffco_fair).to be_instance_of(Carnival)
    end

    it 'has readable attribute name' do
      expect(jeffco_fair.name).to eq("Jefferson County Fair")
    end

    it 'starts with an empty array of rides' do
      expect(jeffco_fair.rides).to eq([])
    end
  end

  describe '#add_ride' do
    jeffco_fair = Carnival.new("Jefferson County Fair")
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})

    jeffco_fair.add_ride(ferris_wheel)
    jeffco_fair.add_ride(bumper_cars)
    jeffco_fair.add_ride(scrambler)

    it 'adds rides to the @rides array' do
      expect(jeffco_fair.rides).to eq([ferris_wheel, bumper_cars, scrambler])
    end
  end
end
