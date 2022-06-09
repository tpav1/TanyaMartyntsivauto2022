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

  #Scenario: User can sign up using helper module
    #Given Gitlab user is signed up
   # Then I see Welcome to GitLab text

  #Scenario: User can select a role
  #Given Gitlab user is signed up
   # And I see Welcome to GitLab text
   # And I select role
   # And I click get started
    #Then I see GitLab quote

  #Scenario: User can log out
    #Given I am signed up
    #And I click header user drop-down toggle
   # And I click sign out
    #Then I see sign in page

