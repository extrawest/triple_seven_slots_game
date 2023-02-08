Feature: Splash screen
  Scenario: App is precaching images and shows splash screen
    Given the app is running
    When I wait for 1 second
    Then I see {'Triple Seven Slots Game'} text

  Scenario: App navigates to main screen after precaching
    Given the app is running
    When I wait for 6 seconds
    Then I see {'Triple Seven Slots'} text