Feature: runAnalyticsApi

  @smoke
  Scenario Outline: API to get Run Analytics
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status | SampleName     |
      | runAnalytics | post   | 200             | suiteAnalytics |

