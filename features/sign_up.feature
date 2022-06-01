Feature: Sign up feature

  Scenario: User can sign up
    Given Gitlab signup page is opened
    When I fill in first name
    And I fill in last name
    And I fill in username
    And I fill in email
    And I fill in password
    And I click register button
    Then I see Welcome to GitLab text