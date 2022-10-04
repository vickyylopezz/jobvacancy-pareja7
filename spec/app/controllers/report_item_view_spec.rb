require 'spec_helper'

describe 'ParseReportInformation' do
  let(:expected) do
    [{ user_email: 'pepe@pepito.com', subscription: 'professional', active_offers_count: 0,
       amount_to_pay: 30.0 }]
  end
  let(:user) do
    user = User.create('pepe@pepito.com', 'pepe@pepito.com', '123456', 'professional')
    user.assign_subscription(SubscriptionFactory.new.create('professional'))
    user
  end

  describe 'parse_items' do
    it 'parse a user with no active offers' do
      repo = instance_double('user_repo', emails: ['pepe@pepito.com'],
                                          find_by_email: user)
      job_offer_repo = instance_double('offer_repo', all_active: [], all_active_for: [])
      offer_counter = OfferCounter.new(job_offer_repo)
      expect(ReportItemView.new.generate_items_view(Biller.new, offer_counter, repo)).to eq expected
    end
  end
end
