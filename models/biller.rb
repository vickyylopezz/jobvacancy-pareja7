class Biller
  def calculate_amount_to_pay(active_offers, subscription)
    subscription.amount_to_pay(active_offers)
  end

  def calculate_total_amount_to_pay(offer_counter, users)
    total = 0
    users.map { |user| total += calculate_amount_to_pay(offer_counter.count_active_for(user), user.subscription_type) }
    total
  end
end
