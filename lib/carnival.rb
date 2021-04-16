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
    @rides.find_all do |ride|
      attendee.interested_in?(ride.name)
    end
  end

  def admit(new_attendee)
    @attendees << new_attendee
  end

  def attendees_by_ride_interest
    @rides.reduce({}) do |attendees_by_ride_interest, ride|
      attendees_by_ride_interest[ride] = @attendees.find_all do |attendee|
        attendee.interested_in?(ride.name)
        end
      attendees_by_ride_interest
    end
  end

  def ticket_lottery_contestants(ride)
    @attendees.find_all do |attendee|
      attendee.interested_in?(ride.name) && attendee.spending_money < ride.cost
    end
  end

  def draw_lottery_winner(ride)
    contestants = ticket_lottery_contestants(ride)
    if contestants != []
      winner_attendee = contestants.sample
      winner_attendee.name
    else
      nil
    end
  end

  def announce_lottery_winner(ride)
    winner = draw_lottery_winner(ride)
    if winner != nil
      "#{winner} has won the #{ride.name} ride"
    else
      "No winners for this lottery"
    end
  end
end
