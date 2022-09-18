require 'spec_helper'

describe OfferCounter do
  describe 'count_active' do
    it 'should be 0 when no active offers' do
      repo = instance_double('offer_repo', all_active: [])
      counter = described_class.new(repo)
      expect(counter.count_active).to eq 0
    end
  end

  describe 'count_active_for' do
    it 'should be 3 when no active offers' do
      repo = instance_double('offer_repo', all_active_for: [1, 1, 1])
      counter = described_class.new(repo)
      expect(counter.count_active_for(1)).to eq 3
    end
  end
end
