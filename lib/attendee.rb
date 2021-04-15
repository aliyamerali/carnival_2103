class Attendee
  attr_reader :name, :spending_money, :interests

  def initialize(name, spending_money)
    @name = name
    @spending_money = spending_money
    @interests = []
  end

  def add_interest(new_interest)
    @interests << new_interest
  end

  def interested_in?(interest)
    @interests.include?(interest)
  end

end
