Feature: suiteAnalyticsApi

  @smoke
  Scenario Outline: API to get the suite analytics
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | SampleName     |
      | suiteAnalytics | post   | 200             | suiteAnalytics |