require 'spec_helper'

describe 'ParseReportInformation' do
  let(:expected) do
    [{ user_email: 'pepe@pepito.com', subscription: 'professional', active_offers_count: 0,
       amount_to_pay: 30.0 }]
  end
  let(:user) { User.create('pepe@pepito.com', 'pepe@pepito.com', '123456', 'professional') }

  describe 'parse_items' do
    it 'parse a user with no active offers' do
      repo = instance_double('user_repo', subscription_per_email: [['pepe@pepito.com', 'professional']],
                                          find_by_email: user)
      job_offer_repo = instance_double('offer_repo', all_active: [], all_active_for: [])
      offer_counter = OfferCounter.new(job_offer_repo)
      expect(ParseReportInformation.new.parse_items(Biller.new, offer_counter, repo)).to eq expected
    end
  end

  describe 'parse_total_active_offers' do
    it 'parse two active offers' do
      job_offer_repo = instance_double('offer_repo', all_active: [1, 2])
      offer_counter = OfferCounter.new(job_offer_repo)
      expect(ParseReportInformation.new.parse_total_active_offers(offer_counter)).to eq 2
    end
  end

  describe 'parse_total_amount' do
    it 'parse a user with no active offers should be 30.0' do
      repo = instance_double('user_repo', subscription_per_email: [['pepe@pepito.com', 'professional']],
                                          find_by_email: user)
      job_offer_repo = instance_double('offer_repo', all_active: [], all_active_for: [])
      offer_counter = OfferCounter.new(job_offer_repo)
      expect(ParseReportInformation.new.parse_total_amount(Biller.new, offer_counter, repo)).to eq 30.0
    end
  end
end
