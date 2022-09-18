class ReportGenerator
  def create_report(user_data, active_offers, total_amount)
    report = {}
    report[:items] = create_items_array(user_data)
    report[:total_active_offers] = active_offers
    report[:total_amount] = total_amount
    report
  end

  def create_items_array(user_data)
    items_array = []
    user_data.each do |user|
      item = { user_email: user[0], subscription: user[1], active_offers_count: user[2],
               amount_to_pay: user[3] }
      items_array.push(item)
    end

    items_array
  end
end
