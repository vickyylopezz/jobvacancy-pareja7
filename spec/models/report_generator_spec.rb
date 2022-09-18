require 'spec_helper'

describe ReportGenerator do
  # create_report(user_data,active_offers,total_amount)
  # rubocop:disable RSpec/ExampleLength

  describe 'create_report' do
    it 'should generate a report with keys items, total_active_offers, total_amount' do
      report = described_class.new.create_report([['pepe@pepito.com', 'professional', 3, 30.0]], 3, 30.0)
      expected_report = {
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
      expect(report).to eq(expected_report)
    end
  end
  # rubocop:enable RSpec/ExampleLength

  #   describe 'create_items_array' do
  #     it 'should generate an items array where each item has the keys user_email, subscription, active_offers_count,
  # mount_to_pay' do
  #         items_array = described_class.new.create_items_array(['pepe@pepe.com','professional',3,30])
  #     end
  #   end
end
