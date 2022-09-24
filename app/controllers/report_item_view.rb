class ReportItemView
  def generate_items_view(biller, offer_counter, user_repo)
    emails = user_repo.emails
    items = []
    emails.each do |email|
      user = user_repo.find_by_email(email)
      active_offers = offer_counter.count_active_for(user)
      amount_to_pay = biller.calculate_amount_to_pay(active_offers, user&.subscription_type)
      items.push(generate_item_view(user&.email, user&.subscription, active_offers, amount_to_pay))
    end
    items
  end

  def generate_item_view(user_email, subscription, active_offers, amount_to_pay)
    {
      user_email: user_email,
      subscription: subscription,
      active_offers_count: active_offers,
      amount_to_pay: amount_to_pay
    }
  end
end
