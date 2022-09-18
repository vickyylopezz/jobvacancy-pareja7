require 'spec_helper'

describe ReportGenerator do
  let(:correct_items_array) do
    [{
      user_email: 'pepe@pepito.com',
      subscription: 'professional',
      active_offers_count: 3,
      amount_to_pay: 30.0
    }]
  end

  let(:correct_report) do
    {
      items: [
        {
          user_email: 'pepe@pepito.com',
          subscription: 'professional',
          active_offers_count: 3,
          amount_to_pay: 30.0
        }
      ],
      total_active_offers: 3,
      total_amount: 30.0
    }
  end

  describe 'create_report' do
    it 'should generate a complete report' do
      report = described_class.new.create_report([['pepe@pepito.com', 'professional', 3, 30.0]], 3, 30.0)
      expect(report).to eq(correct_report)
    end
  end

  describe 'create_items_array' do
    it 'should generate an items array for the report' do
      items_array = described_class.new.create_items_array([['pepe@pepito.com', 'professional', 3, 30.0]])
      expect(items_array).to eq(correct_items_array)
    end
  end
end
