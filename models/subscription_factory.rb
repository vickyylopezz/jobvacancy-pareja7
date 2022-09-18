class SubscriptionFactory
  SUBSCRIPTIONS = {
    'professional' => Professional.new,
    'on-demand' => OnDemand.new,
    'corporate' => Corporate.new
  }.freeze
  def create(subscription)
    SUBSCRIPTIONS[subscription]
  end
end
