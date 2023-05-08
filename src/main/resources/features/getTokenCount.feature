Feature: bridgeTokenApi

  Scenario Outline: To Validate Username (GET)
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status |
      | getTokkenCount | get    | 200             |
#
  Scenario Outline: To Validate Username (GET) when header is not given
    Given Set Empty token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status |
      | getTokkenCount | get    | 403             |
#
  Scenario Outline: To Validate Username (GET) when wrong authentication passed
    Given Set Wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status |
      | getTokkenCount | get    | 403             |