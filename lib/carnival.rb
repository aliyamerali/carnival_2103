class Carnival
  attr_reader :name, :rides

  def initialize(name)
    @name = name
    @rides = []
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
end
