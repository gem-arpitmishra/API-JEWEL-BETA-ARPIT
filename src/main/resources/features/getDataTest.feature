Feature: getTestDataApi

  @smoke
  Scenario Outline: Get data of test case
    Given Set endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | Gettest  | get    | 200             |

  Scenario Outline:Get data of Testcase TC-run-id not valid
    Given Authenticate endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | Gettest2 | get    | 400             |