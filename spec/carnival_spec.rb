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

    it 'starts with an empty array of attendees' do
      expect(jeffco_fair.attendees).to eq([])
    end
  end

  describe 'ride management methods' do
    jeffco_fair = Carnival.new("Jefferson County Fair")
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})

    it '#add_ride adds rides to the @rides array' do
      jeffco_fair.add_ride(ferris_wheel)
      jeffco_fair.add_ride(bumper_cars)
      jeffco_fair.add_ride(scrambler)

      expect(jeffco_fair.rides).to eq([ferris_wheel, bumper_cars, scrambler])
    end

    it '#recommend_rides returns an array of rides matching the attendees interests' do
      bob = Attendee.new('Bob', 20)
      sally = Attendee.new('Sally', 20)
      bob.add_interest('Ferris Wheel')
      bob.add_interest('Bumper Cars')
      sally.add_interest('Scrambler')

      expect(jeffco_fair.recommend_rides(bob)).to eq([ferris_wheel, bumper_cars])
      expect(jeffco_fair.recommend_rides(sally)).to eq([scrambler])
    end
  end

  describe 'admission and attendee management methods' do
    jeffco_fair = Carnival.new("Jefferson County Fair")
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})
    jeffco_fair.add_ride(ferris_wheel)
    jeffco_fair.add_ride(bumper_cars)
    jeffco_fair.add_ride(scrambler)
    bob = Attendee.new("Bob", 0)
    bob.add_interest('Ferris Wheel')
    bob.add_interest('Bumper Cars')
    sally = Attendee.new('Sally', 20)
    sally.add_interest('Bumper Cars')
    johnny = Attendee.new("Johnny", 5)
    johnny.add_interest('Bumper Cars')

    it '#admit adds attendees to an attendee array' do
      jeffco_fair.admit(bob)
      jeffco_fair.admit(sally)
      jeffco_fair.admit(johnny)

      expect(jeffco_fair.attendees).to eq([bob, sally, johnny])
    end

    it '#attendees_by_ride_interest returns hash of [rides => interested attendee objects]' do
      output = jeffco_fair.attendees_by_ride_interest

      expect(output.class).to eq(Hash)
      expect(output[scrambler]).to eq([])
      expect(output[bumper_cars]).to eq([bob, sally, johnny])
    end

    it '#ticket_lottery_contestants returns array of attendee objs with interest in the given ride and not enough $ for ride' do
      output = jeffco_fair.ticket_lottery_contestants(bumper_cars)

      expect(output).to eq([bob, johnny])
    end
  end

end
