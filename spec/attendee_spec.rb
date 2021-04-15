require './lib/attendee'

RSpec.describe Attendee do
  describe '#initialize' do
    attendee = Attendee.new('Bob', 20)

    it 'exists' do
      expect(attendee).to be_instance_of(Attendee)
    end

    it 'has readable attributes name and spending money' do
      expect(attendee.name).to eq("Bob")
      expect(attendee.spending_money).to eq(20)
    end

    it 'starts with an empty array of interests' do
      expect(attendee.interests).to eq([])
    end
  end

  describe '#add_interest' do
    attendee = Attendee.new('Bob', 20)
    attendee.add_interest('Bumper Cars')
    attendee.add_interest('Ferris Wheel')

    it 'adds an interest to the array of interests' do
      expect(attendee.interests).to eq(["Bumper Cars", "Ferris Wheel"])
    end
  end

  describe '#interested_in?' do
    attendee = Attendee.new('Bob', 20)
    attendee.add_interest('Bumper Cars')
    attendee.add_interest('Ferris Wheel')

    it 'returns true or false if the interest passed in is included' do
      expect(attendee.interested_in?("Bumper Cars")).to eq(true)
      expect(attendee.interested_in?("Scrambler")).to eq(false)
    end
  end

end
