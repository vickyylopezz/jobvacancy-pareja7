JobVacancy::App.controllers :reports, provides: [:json] do
  get :billing do
    repo = JobOfferRepository.new
    offer_counter = OfferCounter.new(repo)
    report = {
      items: [
        {
          user_email: 'pepe@pepito.com',
          subscription: 'professional',
          active_offers_count: 0,
          amount_to_pay: 30.0
        }
      ],
      total_active_offers: offer_counter.count_active,
      total_amount: 30.0
    }
    return report.to_json
  end
end
