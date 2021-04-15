class Carnival
  attr_reader :name, :rides

  def initialize(name)
    @name = name
    @rides = []
  end

  def add_ride(new_ride)
    @rides << new_ride
  end
end
