JobVacancy::App.controllers :reports, provides: [:json] do
  get :billing do
    job_offer_repo = JobOfferRepository.new
    offer_counter = OfferCounter.new(job_offer_repo)
    report_generator = ReportGenerator.new
    user_repo = UserRepository.new
    biller = Biller.new

    parser = ParseReportInformation.new
    items = parser.parse_items(biller, offer_counter, user_repo)
    report_generator.add_key_to_report('items', items)

    total_active_offers = parser.parse_total_active_offers(offer_counter)
    report_generator.add_key_to_report('total_active_offers', total_active_offers)

    total_amount = parser.parse_total_amount(biller, offer_counter, user_repo)
    report_generator.add_key_to_report('total_amount', total_amount)

    return report_generator.report.to_json
  end
end
