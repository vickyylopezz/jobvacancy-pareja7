require 'json'

Given('user {string} with an on-demand susbcription') do |user_email|
  @user = User.create(user_email, user_email, 'somePassword!')
  UserRepository.new.save(@user)
end

Given('there are no offers at all') do
  JobOfferRepository.new.delete_all
end

When('I get the billing report') do
  visit 'reports/billing'
  @report_as_json = JSON.parse(page.body)
end

Then('the total active offers is {int}') do |expected_active_offers|
  expect(@report_as_json['total_active_offers']).to eq expected_active_offers
end

Then('the total amount is {float}') do |_expected_total_amount|
  pendiente
end

Given(/^a user "(.*?)" with "(.*?)" subscription$/) do |user_email, subscription_type|
  @user = User.create(user_email, user_email, 'somePassword!', subscription_type)
  UserRepository.new.save(@user)
end

Given(/^(\d+) active offers$/) do |offer_count|
  offer_count.times do
    @job_offer = JobOffer.new(title: 'test', location: 'a nice job', description: 'a nice job')
    @job_offer.owner = UserRepository.new.find_by_email(@user.email)
    @job_offer.is_active = true

    JobOfferRepository.new.save @job_offer
  end
end

Then('the amount to pay for the user {string} is {float}') do |user_email_input, expected_amount|
  user = @report_as_json['items'].find { |item| item['user_email'] == user_email_input }

  expect(user['amount_to_pay']).to eq expected_amount
end

Then(/^the total active offers are (\d+)$/) do |expected_offer_count|
  expect(@report_as_json['total_active_offers']).to eq expected_offer_count
end

Given('another user {string} with {string} susbcription') do |_user_email, _subscription_type|
  pending # Write code here that turns the phrase above into concrete actions
end

Given('the user {string} has {int} active offers') do |_user_email, _active_offer_count|
  pending # Write code here that turns the phrase above into concrete actions
end

Given('{int} inactive offers') do |_inactive_offer_count|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('the billing for this user is {float}') do |_expected_amount|
  pending # Write code here that turns the phrase above into concrete actions
end

Given('the user {string}') do |_user_email|
  pending # Write code here that turns the phrase above into concrete actions
end

Given('another user with {string} susbcription') do |_subscription_type|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('the amount to pay for the user {string} is {float}.') do |_user_email, _expected_amount|
  pending # Write code here that turns the phrase above into concrete actions
end
