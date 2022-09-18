class Biller
  def calculate_amount_to_pay(active_offers, subscription)
    subscription.amount_to_pay(active_offers)
  end
end
