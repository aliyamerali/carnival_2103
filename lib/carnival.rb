class Carnival
  attr_reader :name, :rides, :attendees

  def initialize(name)
    @name = name
    @rides = []
    @attendees = []
  end

  def add_ride(new_ride)
    @rides << new_ride
  end

  def recommend_rides(attendee)
    attendee_interests = attendee.interests
    @rides.find_all do |ride|
      attendee_interests.include?(ride.name)
    end
  end

  def admit(new_attendee)
    @attendees << new_attendee
  end
end
