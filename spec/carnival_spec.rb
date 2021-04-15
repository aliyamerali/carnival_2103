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
end
