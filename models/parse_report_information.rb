class ParseReportInformation
  EMAIL_INDEX = 0
  SUBSCRIPTION_INDEX = 1
  def parse_items(biller, offer_counter, user_repo)
    subscription_per_email = user_repo.subscription_per_email
    items = []
    subscription_per_email.each do |user_data|
      user = user_repo.find_by_email(user_data[EMAIL_INDEX])
      active_offers = offer_counter.count_active_for(user&.id)
      amount_to_pay = biller.calculate_amount_to_pay(active_offers,
                                                     SubscriptionFactory.new.create(user_data[SUBSCRIPTION_INDEX]))
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
    subscription_per_email = user_repo.subscription_per_email
    total_amount = 0
    subscription_per_email.each do |user_data|
      user = user_repo.find_by_email(user_data[EMAIL_INDEX])
      amount_to_pay = biller.calculate_amount_to_pay(offer_counter.count_active_for(user&.id),
                                                     SubscriptionFactory.new.create(user_data[SUBSCRIPTION_INDEX]))
      total_amount += amount_to_pay
    end
    total_amount
  end
end
