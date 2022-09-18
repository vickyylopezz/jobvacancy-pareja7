JobVacancy::App.controllers :reports, provides: [:json] do
  get :billing do
    job_offer_repo = JobOfferRepository.new
    offer_counter = OfferCounter.new(job_offer_repo)
    report_generator = ReportGenerator.new
    user_repo = UserRepository.new
    biller = Biller.new

    total_active_offers = offer_counter.count_active

    total_amount = 0
    # TO-DO: Refactoring to accomplish SOLID principle
    subscription_per_email = user_repo.subscription_per_email
    puts subscription_per_email.to_s
    subscription_per_email.each do |user_data|
      user = user_repo.find_by_email(user_data[0])
      user_data.push(offer_counter.count_active_for(user&.id))
      user_data.push(biller.calculate_amount_to_pay(offer_counter.count_active_for(user&.id),
                                                    SubscriptionFactory.new.create(user_data[1])))
      total_amount += biller.calculate_amount_to_pay(offer_counter.count_active_for(user&.id),
                                                     SubscriptionFactory.new.create(user_data[1]))
    end

    report = report_generator.create_report(subscription_per_email, total_active_offers, total_amount)
    return report.to_json
  end
end
