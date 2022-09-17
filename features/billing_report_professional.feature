@billing
Feature: Professional Billing Report

  Background:
    Given a user "pepe@pepito.com" with "professional" subscription

  Scenario: p1 - professional subscription with no offers
    Given 0 active offers
    When I get the billing report
    Then the amount to pay for the user "pepe@pepito.com" is 30.0
    And the total active offers are 0

  @wip
  Scenario: p2 - professional subscription with one offers
    Given 1 active offers
    When I get the billing report
    Then the amount to pay for the user "pepe@pepito.com" is 30.
    And the total active offers are 1

  @wip
  Scenario: p3 - professional subscription with 7 offers
    Given 7 active offers
    When I get the billing report
    Then the amount to pay for the user "pepe@pepito.com" is 44.0
    And the total active offers are 7

  @wip
  Scenario: p4 - professional subscription with 5 offers
    Given 5 active offers
    When I get the billing report
    Then the amount to pay for the user "pepe@pepito.com" is 30.0
    And the total active offers are 5

  @wip
  Scenario: p5 - professional subscription with 3 offers each
    Given 3 active offers
    And another user "maria@maria.com" with "professional" susbcription
    And 3 active offers
    When I get the billing report
    Then the amount to pay for the user "pepe@pepito.com" is 30.0
    And the amount to pay for the user "maria@maria.com" is 30.0
    And the total amount is 60.0
    And the total active offers are 6

  @wip
  Scenario: p6 - professional subscription with 5 active offers and 2 inactive offers
    Given 5 active offers
    And 2 inactive offers
    When I get the billing report
    Then the amount to pay for the user "pepe@pepito.com" is 30.0
    And the total active offers are 5    