Feature: loginApi

  @smoke
  Scenario Outline: Login User
    Given Set endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName       |
      | Login    | Post   | 200             | Login_sampleJson |

  Scenario Outline: Login User with wrong credentials
    Given Set credentials endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName          |
      | Login    | Post   | 400             | loginInvalid_sample |

  Scenario Outline: Login User with Empty Fields
    Given Set credentials endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName        |
      | Login    | Post   | 400            | Login3_sampleJson |

  Scenario Outline: Login User with Empty Body
    Given Set credentials endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName        |
      | Login    | Post   | 400             | Login4_sampleJson |