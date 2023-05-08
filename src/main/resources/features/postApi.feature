Feature: createUserApi

  @smoke
  Scenario Outline: Create New User
    Given  Set Suite-API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName            |
      | Post     | Post   | 201             | Postgemini_sampleJson |

  Scenario Outline: Create New User Already Exists
    Given  Set Suite-API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName             |
      | Post     | Post   | 409             | Postgemini2_sampleJson |

  Scenario Outline: Create New User When Compulsory field not present
    Given  Set Suite-API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName             |
      | Post     | Post   | 500             | Postgemini3_sampleJson |

  Scenario Outline: Create New User When giving empty body
    Given  Set Suite-API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName             |
      | Post     | Post   | 500             | Postgemini4_sampleJson |

#  Scenario Outline: Create New User When giving wrong E-mail
#    Given  Set Suite-API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint | Method | Expected_status | SampleName             |
#      | Post     | Post   | 400             | Postgemini5_sampleJson |
