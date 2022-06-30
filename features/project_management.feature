Feature: This is a course milestone script

  Scenario: Users can efficiently perform project management in GitLab
    Given I register 'Project Owner' user via 'API'
    And I see this 'Project Owner' user is registered via 'API'
    And I register 'Developer' user via 'API'
    And I see this 'Developer' user is registered via 'API'

  Scenario: Developer user can sign up via UI
    Given Gitlab sign up page is opened
    When I register user via UI
    And I see new user welcome page
    And I see Role drop-down field
    And I click on Role drop-down
    And I select 'Developer' role
    And I click 'Get started' button
    And I see this 'Developer' user is registered via 'UI'

    When I log in to gitlab with 'Project Owner' user
    And I see the 'Project Owner' user is logged in
    Then I can see 'Create a project' button on the 'Home Page'
    When I create a new blank project
    Then I see that project was successfully created

    When I press 'Project Information'
    And I select 'Members'
    Then I see 'Project Members' page


    When I log out
    Then I can delete 'Project Owner' user via API
    And I can delete 'Developer' user via API