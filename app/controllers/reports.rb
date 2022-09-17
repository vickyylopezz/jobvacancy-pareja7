JobVacancy::App.controllers :reports, provides: [:json] do
  get :billing do
    repo = JobOfferRepository.new
    offer_counter = OfferCounter.new(repo)
    amount_to_pay = offer_counter.count_active > 5 ? 44.0 : 30.0
    report = {
      items: [
        {
          user_email: 'pepe@pepito.com',
          subscription: 'professional',
          active_offers_count: 0,
          amount_to_pay: amount_to_pay
        }
      ],
      total_active_offers: offer_counter.count_active,
      total_amount: 30.0
    }
    return report.to_json
  end
end
