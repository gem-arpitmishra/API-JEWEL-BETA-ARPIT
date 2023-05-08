Feature: culpritApi

  @smoke
  Scenario Outline: API to get culprit test cases
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | SampleName |
      | culpritApi | post   | 200             | culpritApi |