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
end
