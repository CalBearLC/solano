# Copyright (c) 2011-2016 Solano Labs All Rights Reserved
@mimic
Feature: spec command
  As a solano user
  In order to run tests
  I want to start a test session

Background:
  Given the command is "solano spec"

Scenario: Display passing result
  Given the destination repo exists
  And a git repo is initialized
  And the user is logged in with a configured suite
  And the user has the following keys:
    | name      |
    | default   |
  And the user can create a session
  And the user successfully registers tests for the suite with test_pattern: "spec/foo"
  And the tests start successfully
  And the test all pass
  When I run `solano spec --max-parallelism=1 --test-pattern=spec/foo`
  Then the exit status should be 0
  And the output should contain "Starting Session"
  And the output should contain "To view results"
  And the output should contain "Final result: passed."
  And options should not be saved
