Feature: downloadApi

#  @smoke
  Scenario Outline: download API
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status |
      | downloadApi | get    | 200             |