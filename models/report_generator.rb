class ReportGenerator
  def create_report(user_data, active_offers, total_amount)
    report = {}
    report[:items] = []
    user_data.each do |user|
      item = { user_email: user[0], subscription: user[1], active_offers_count: user[2],
               amount_to_pay: user[3] }
      report[:items].push(item)
    end
    report[:total_active_offers] = active_offers
    report[:total_amount] = total_amount
    report
  end
end
