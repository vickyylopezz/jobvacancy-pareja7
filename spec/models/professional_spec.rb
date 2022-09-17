require 'spec_helper'

describe Professional do
  describe 'amount_to_pay' do
    it 'should be 0 when no active offers' do
      professional = described_class.new
      amount_to_pay = professional.amount_to_pay(0)
      expect(amount_to_pay).to eq 0.0
    end

    it 'should be 30.0 when active offers are 4' do
      professional = described_class.new
      amount_to_pay = professional.amount_to_pay(4)
      expect(amount_to_pay).to eq 30.0
    end

    xit 'should be 30.0 when active offers are 5' do
      professional = described_class.new
      amount_to_pay = professional.amount_to_pay(5)
      expect(amount_to_pay).to eq 30.0
    end

    xit 'should be 44.0 when active offers are 7' do
      professional = described_class.new
      amount_to_pay = professional.amount_to_pay(7)
      expect(amount_to_pay).to eq 44.0
    end
  end
end
