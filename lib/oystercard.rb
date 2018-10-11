class Oystercard
  MAX_BALANCE = 90
  MIN_CHARGE = 1
  attr_reader :balance
  attr_reader :entry_station
  attr_reader :exit_station

  def initialize
    @balance = 0
  end

  def top_up(money)
    raise "Card Limit of #{MAX_BALANCE} Exceeded" if balance + money > MAX_BALANCE
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

  # def in_journey?
  #   @in_journey
  # end

  def in_journey?
    !!entry_station
  end

  def touch_in(entry_station)
    raise "Insufficient balance to touch in" if balance < MIN_CHARGE
#    @in_journey = true
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MIN_CHARGE)
    @entry_station = nil
    @exit_station = exit_station
  end

end
