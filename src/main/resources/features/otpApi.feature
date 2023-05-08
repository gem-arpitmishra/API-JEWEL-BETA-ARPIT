Feature: otpApi

  @smoke
  Scenario Outline: API to get the otp on the email
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | otpApi   | post   | 201             | otpApi     |

  Scenario Outline: API to get the otp on mail when wrong username is passed
    Given Sett posttt token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | otpApi   | post   | 400             | otp1       |