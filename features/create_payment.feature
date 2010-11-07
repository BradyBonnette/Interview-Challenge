Feature: Payment Processing
  In order to process a payment
  As a user
  I want to create and process a new payment
  
  Scenario: Go To The Payment Processing Site
    Given I want to go to the "Create New Payment" site
    When I go to the "Create New Payment" site
    Then I should see a selection box for "Payment Type"
    And I should see a textbox for "Customer Name"
    And I should see a textbox for "Customer Address"
    And I should see a textbox for "Customer Email"
    And I should see a button for "Create Payment"
	
	Scenario: Create Invalid Payment
		Given I am on the "Create New Payment" site
		When I press "Create Payment"
		Then I should see an error message

  Scenario: Create New Book Payment
    Given I am on the "Create New Payment" site
    When I select "Book" from "Payment Type"
    And I fill in "Customer Name" with "Bob"
    And I fill in "Customer Address" with "Beverly Hills, 90210"
    And I fill in "Customer Email" with "bob@bob.com"
    And I press "Create Payment"
    Then I should see "Payment processed."
    And I should see "Creating Duplicate Packing Slips, One For The Royalty Department"

  Scenario: Create New Physical Object Payment
    Given I am on the "Create New Payment" site
    When I select "Physical Object" from "Payment Type"
    And I fill in "Customer Name" with "Bob"
    And I fill in "Customer Address" with "Beverly Hills, 90210"
    And I fill in "Customer Email" with "bob@bob.com"
    And I press "Create Payment"
    Then I should see "Payment processed."
    And I should see "Creating Packing Slip"

  Scenario: Create New Membership Payment
    Given I am on the "Create New Payment" site
    When I select "Membership" from "Payment Type"
    And I fill in "Customer Name" with "Bob"
    And I fill in "Customer Address" with "Beverly Hills, 90210"
    And I fill in "Customer Email" with "bob@bob.com"
    And I press "Create Payment"
    Then I should see "Payment processed."
    And I should see "Sending E-mail to Bob"
