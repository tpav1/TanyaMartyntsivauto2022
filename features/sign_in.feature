Feature: Sign in feature

  Scenario: User can log in
    Given Gitlab login page is opened
    When I enter username
    And I enter password
    And I click sign in button
    Then I see the welcome message text

   # Scenario: User can login using helper module
      #Given GitLab user is signed in
      #Then  I see the welcome message text
