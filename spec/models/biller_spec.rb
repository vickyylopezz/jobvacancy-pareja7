require 'spec_helper'

describe Biller do
  describe 'amount_to_pay' do
    it 'should be 30.0 when no active offers and subscription is professional' do
      biller = described_class.new
      amount_to_pay = biller.calculate_amount_to_pay(0, Professional.new)
      expect(amount_to_pay).to eq 30.0
    end

    it 'should be 30.0 when active offers are 3 and subscription is professional' do
      biller = described_class.new
      amount_to_pay = biller.calculate_amount_to_pay(3, Professional.new)
      expect(amount_to_pay).to eq 30.0
    end

    it 'should be 44.0 when active offers are 7 and subscription is professional' do
      biller = described_class.new
      amount_to_pay = biller.calculate_amount_to_pay(7, Professional.new)
      expect(amount_to_pay).to eq 44.0
    end
  end

  describe 'total_amount_to_pay' do
    let(:user1) do
      user = User.create('pepe@pepe.com', 'pepe@pepe.com', '123456', 'professional')
      user.assign_subscription(SubscriptionFactory.new.create('professional'))
      user
    end

    let(:user2) do
      user = User.create('pepe@pepito.com', 'pepe@pepito.com', '123456', 'on-demand')
      user.assign_subscription(SubscriptionFactory.new.create('on-demand'))
      user
    end

    it 'should be 30.0 when no active offers and subscription is professional' do
      biller = described_class.new
      offer_counter = instance_double('offer_counter', count_active_for: 1)
      total_amount_to_pay = biller.calculate_total_amount_to_pay(offer_counter, [user1, user2])
      expect(total_amount_to_pay).to eq 40.0
    end
  end
end
