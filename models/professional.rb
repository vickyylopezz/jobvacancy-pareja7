class Professional
  MAX_BASE_OFFERS = 5
  BASE_CHARGE = 30.0
  PRICE_PER_EXTRA_OFFER = 7.0

  def amount_to_pay(active_offers)
    BASE_CHARGE + extra_charge(active_offers - MAX_BASE_OFFERS)
  end

  def extra_charge(extra_offers)
    return 0 if extra_offers.negative?

    extra_offers * PRICE_PER_EXTRA_OFFER
  end
end
