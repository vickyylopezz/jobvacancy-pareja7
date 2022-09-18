class SubscriptionFactory
  SUBSCRIPTIONS = {
    'professional' => Professional.new,
    'on-demand' => OnDemand.new
  }.freeze
  def create(subscription)
    SUBSCRIPTIONS[subscription]
  end
end
