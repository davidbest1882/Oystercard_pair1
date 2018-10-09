require './lib/oystercard'

describe Oystercard do

  it "checks for existance of oystercard" do
    expect(subject).to be_instance_of(Oystercard)
  end

  it 'The card has balance of zero?' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
#    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      subject.top_up(Oystercard::MAX_BALANCE)
      expect{ subject.top_up 1 }.to raise_error "Card Limit of #{Oystercard::MAX_BALANCE} Exceeded"
    end
  end

#  it { is_expected.to respond_to(:deduct).with(1).argument }

  it 'deducts an amount from the balance' do
    subject.top_up(Oystercard::MAX_BALANCE)
    expect{ subject.deduct(3) }.to change{ subject.balance }.by -3
  end

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end

  it 'can touch in' do
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it 'can touch out' do
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

end
