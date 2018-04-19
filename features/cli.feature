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
    When I run bin/twee with "--test yegor256@gmail.com --host test --user test --password test --subject test --letter a.liquid --from me@example.com --dry --resume test@example.com"
    Then Stdout contains "Processed 1 email"
    And Exit code is zero
