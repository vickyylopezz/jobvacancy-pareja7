require 'spec_helper'

describe Corporate do
  describe 'amount_to_pay' do
    it 'should be 80.0 when no active offers' do
      on_demand = described_class.new
      amount_to_pay = on_demand.amount_to_pay(0)
      expect(amount_to_pay).to eq 80.0
    end
  end
end
