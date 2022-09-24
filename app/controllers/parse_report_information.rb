class ParseReportInformation
  EMAIL_INDEX = 0
  SUBSCRIPTION_INDEX = 1
  def parse_items(biller, offer_counter, user_repo)
    emails = user_repo.emails
    items = []
    emails.each do |email|
      user = user_repo.find_by_email(email)
      active_offers = offer_counter.count_active_for(user)
      amount_to_pay = biller.calculate_amount_to_pay(active_offers, user&.subscription_type)
      items.push(parse_item(user&.email, user&.subscription, active_offers, amount_to_pay))
    end
    items
  end

  def parse_item(user_email, subscription, active_offers, amount_to_pay)
    {
      user_email: user_email,
      subscription: subscription,
      active_offers_count: active_offers,
      amount_to_pay: amount_to_pay
    }
  end

  def parse_total_active_offers(offer_counter)
    offer_counter.count_active
  end

  def parse_total_amount(biller, offer_counter, user_repo)
    emails = user_repo.emails
    total_amount = 0
    emails.each do |email|
      user = user_repo.find_by_email(email)
      amount_to_pay = biller.calculate_amount_to_pay(offer_counter.count_active_for(user),
                                                     user&.subscription_type)
      total_amount += amount_to_pay
    end
    total_amount
  end
end
