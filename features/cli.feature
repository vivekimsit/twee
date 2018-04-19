Feature: Command Line Processing
  As a message author I want to be able to send some DMs

  Scenario: Help can be printed
    When I run bin/twee with "--help"
    Then Exit code is zero
    And Stdout contains "--help"

  Scenario: Version can be printed
    When I run bin/twee with "--version"
    Then Exit code is zero

  Scenario: Sending test DMs
    Given I have a ".twee" file with content:
    """
    --key=X
    --secret=X
    --token=X
    --tsecret=X
    """
    When I run bin/twee with "dm"
    Then Stdout contains "Hello"
    And Exit code is zero
