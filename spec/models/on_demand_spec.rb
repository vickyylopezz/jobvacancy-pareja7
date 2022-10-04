require 'spec_helper'

describe OnDemand do
  describe 'amount_to_pay' do
    it 'should be 0.0 when no active offers' do
      on_demand = described_class.new
      amount_to_pay = on_demand.amount_to_pay(0)
      expect(amount_to_pay).to eq 0.0
    end

    it 'should be 10.0 when one offer is active' do
      on_demand = described_class.new
      amount_to_pay = on_demand.amount_to_pay(1)
      expect(amount_to_pay).to eq 10.0
    end

    it 'should be 100.0 when ten offers are active' do
      on_demand = described_class.new
      amount_to_pay = on_demand.amount_to_pay(10)
      expect(amount_to_pay).to eq 100.0
    end
  end
end
