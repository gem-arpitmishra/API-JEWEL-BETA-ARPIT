Feature: dashBoardApi

  @smoke
  Scenario Outline: API to get Suite Status Count
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status | SampleName   |
      | dashboardApi | post   | 200             | dashboardApi |