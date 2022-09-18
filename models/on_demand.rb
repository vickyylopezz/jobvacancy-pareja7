class OnDemand
  PRICE_PER_OFFER = 10.0
  def amount_to_pay(active_offers)
    active_offers * PRICE_PER_OFFER
  end
end
