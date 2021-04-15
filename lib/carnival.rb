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

  def attendees_by_ride_interest
    attendees_by_ride_interest = {}
    @rides.each do |ride|
      attendees_by_ride_interest[ride] = @attendees.find_all do |attendee|
        attendee.interests.include?(ride.name) #REFACTOR --> Helper method?
      end
    end
    attendees_by_ride_interest
  end

  def ticket_lottery_contestants(ride)
    @attendees.find_all do |attendee|
      attendee.interests.include?(ride.name) && attendee.spending_money < ride.cost
    end
  end
end
