class UserRepository < BaseRepository
  self.table_name = :users
  self.model_class = 'User'

  def users
    load_collection dataset
  end

  def find_by_email(email)
    row = dataset.first(email: email)
    load_object(row) unless row.nil?
  end

  def emails
    dataset.select_map(:email)
  end

  def load_object(a_record)
    user = super
    subscription = SubscriptionFactory.new.create(user.subscription)
    user.assign_subscription(subscription)
    user
  end

  protected

  def changeset(user)
    {
      name: user.name,
      crypted_password: user.crypted_password,
      email: user.email,
      subscription: user.subscription
    }
  end
end
