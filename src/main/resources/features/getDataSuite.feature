Feature: getSuiteDataApi

  @smoke
  Scenario Outline: Sample-2
    Given Set endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | Gettt    | get    | 200             |

  Scenario Outline: Get data of suite s-run id not present - 2
    Given Authenticate endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | Gettte   | get    | 400             |
