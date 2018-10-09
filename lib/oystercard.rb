class Oystercard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  attr_reader :balance

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

  def touch_in
    raise "Minimum balance of #{Oystercard::MIN_BALANCE} not met" if balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
