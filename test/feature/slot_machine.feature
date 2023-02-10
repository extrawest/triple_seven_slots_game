Feature: Slot Machine
  Scenario Outline: User increases bet
    Given I'm on Slot machine screen
    When I tap <button> text
    And I wait for 1 second
    Then I see <result> text

    Examples:
    | button | result |
    | '+'    | '6000' |
    | '-'    | '4000' |

  Scenario: User spins jackpot wheel
    Given I'm on Jackpot spin wheel
    When I tap {'Spin'} text
    And I wait for 6 seconds
    Then I see {SpinPrizeDialog} widget

  Scenario: User spins slot machine
    Given I'm on Slot machine screen
    When I tap {'Spin'} text
    And I wait for 6 seconds
    Then I see {PrizeDialog} widget

  Scenario: Initial bet is 5000
    Given I'm on Slot machine screen
    Then I see {'5000'} text

  Scenario: User spins jackpot wheel spin button should be replaced with back button after
    Given I'm on Jackpot spin wheel
    When I tap {'Spin'} text
    And I wait for 6 seconds
    Then I see {SpinPrizeDialog} widget
    When I tap outside SpinPrizeDialog
    Then I see {'Back'} text