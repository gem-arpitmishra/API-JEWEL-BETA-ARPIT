Feature: runningRunApi

  @smoke
  Scenario Outline: API to get Running Suites
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | SampleName   |
      | runningRunApi | post   | 200             | recentRunApi |