Feature: Spin Wheel
  Scenario: User taps spin wheel button and get prize dialog when it stops
    Given I'm on Spin wheel screen
    When I tap {'Spin'} text
    And I wait for 6 seconds
    Then I see {'Congratulations!'} text

  Scenario: User taps spin wheel button and then timer appears instead of it
    Given I'm on Spin wheel screen
    Then I see {SpinButton} widget
    When I tap {'Spin'} text
    When I wait for 1 second
    Then I see {'00:00:00'} text

  Scenario: Spin wheel multipliers must be from 1 to 7
    Given I'm on Spin wheel screen
    Then I see {'x1'} text
    And I see {'x2'} text
    And I see {'x4'} text
    And I see {'x5'} text
    And I see {'x6'} text
    And I see {'x7'} text
