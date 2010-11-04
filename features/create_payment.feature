Feature: Payment Processing
  In order to process a payment
  As a user
  I want to create and process a new payment
  
  @ignore
  Scenario: Go To The Payment Processing Site
    Given I want to go to the "Create New Payment" site
    When I go to the "Create New Payment" site
    Then I should see a selection box for "Payment Type"
    And I should see a textbox for "Customer Name"
    And I should see a textbox for "Customer Address"
    And I should see a textbox for "Customer Email"
    And I should see a button for "Create Payment"

  Scenario: Create New Book Payment
    Given I am on the "Create New Payment" site
    When I select "Book" from "Payment Type"
    And I fill in "Customer Name" with "Bob"
    And I fill in "Customer Address" with "Beverly Hills, 90210"
    And I fill in "Customer Email" with "bob@bob.com"
    And I press "Create Payment"
    Then I should see "Payment Processed."
    And I should see that the processed payment type is "Book"
    And I should see that the customer's name is "Bob"
    And I should see that the customer's address is "Beverly Hills, 90210"
    And I should see that the customer's email address is "bob@bob.com"
