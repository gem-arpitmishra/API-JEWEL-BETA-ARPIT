Feature: reportNameApi

  @smoke
  Scenario Outline: Get Report Names(GET)
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status |
      | reportNames | get    | 200             |
#
  Scenario Outline: Get Report Names(GET) when header is not given
    Given Set Empty token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status |
      | reportNames | get    | 403             |
#
  Scenario Outline: Get Report Names(GET) when wrong authentication passed
    Given Set Wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status |
      | reportNames | get    | 403             |