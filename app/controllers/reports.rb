JobVacancy::App.controllers :reports, provides: [:json] do
  get :billing do
    job_offer_repo = JobOfferRepository.new
    offer_counter = OfferCounter.new(job_offer_repo)
    report_generator = ReportGenerator.new
    user_repo = UserRepository.new
    biller = Biller.new

    item_report = ReportItemView.new
    items = item_report.generate_items_view(biller, offer_counter, user_repo)
    report_generator.add_key_to_report('items', items)

    report_generator.add_key_to_report('total_active_offers', offer_counter.count_active)

    total_amount = biller.calculate_total_amount_to_pay(offer_counter, user_repo.users)
    report_generator.add_key_to_report('total_amount', total_amount)

    return report_generator.report.to_json
  end
end
