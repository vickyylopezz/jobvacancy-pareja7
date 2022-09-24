class OfferCounter
  def initialize(offer_repo)
    @repo = offer_repo
  end

  def count_active
    @repo.all_active.size
  end

  def count_active_for(user)
    @repo.all_active_for(user).size
  end
end
