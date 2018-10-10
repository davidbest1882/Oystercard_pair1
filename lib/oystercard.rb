class Oystercard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  attr_reader :balance
  attr_reader :entry_station

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

  def in_journey?
    @in_journey
  end

  def touch_in(station)
    raise "Minimum balance of #{Oystercard::MIN_BALANCE} not met" if balance < MIN_BALANCE
    @in_journey = true
    @entry_station = station
  end

  def touch_out
    @in_journey = false
  end

end
