require 'spec_helper'

describe Biller do
  describe 'amount_to_pay' do
    it 'should be 30.0 when no active offers and subscription is professional' do
      biller = described_class.new
      amount_to_pay = biller.calculate_amount_to_pay(0, Professional.new)
      expect(amount_to_pay).to eq 30.0
    end
  end
end
