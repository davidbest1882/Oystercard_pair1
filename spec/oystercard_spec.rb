require './lib/oystercard'

describe Oystercard do
#  let(:station) { double :station }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

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
    subject.top_up(Oystercard::MAX_BALANCE)
    subject.touch_in(entry_station)
    expect(subject).to be_in_journey
  end

  it 'can touch out' do
    subject.touch_out(exit_station)
    expect(subject).not_to be_in_journey
  end

  it 'has minimum balance of 1 for a journey' do
#    context 'balance is less than 1'
    expect{subject.touch_in(entry_station)}.to raise_error "Insufficient balance to touch in"
  end

  it 'stores the entry station' do
    subject.top_up(20)
    subject.touch_in(entry_station)
    expect(subject.entry_station).to eq entry_station
  end

  it 'Stores exit station' do
    subject.top_up(20)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.exit_station).to eq exit_station
  end
  # it 'shows an array of journeys' do
  #
  #   expect(subject.show_journeys).to eq [ {"touch_in1" => "touch_out1"}, {"touch_in2" => "touch_out2"} ]
  # end

end
