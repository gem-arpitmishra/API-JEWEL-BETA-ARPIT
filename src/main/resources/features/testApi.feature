Feature: testApi
#
#  Scenario Outline: API to get the List of Tests in the Application GEMPYP case
#    Given Set token endpoint and method "<endpoint>" and "<Method>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint         | Method | Expected_status |
#      | testApiGetGempyp | get    | 200             |
###
#  Scenario Outline: API to get the List of Tests in the Application GEMJAR case
#    Given Set token endpoint and method "<endpoint>" and "<Method>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint         | Method | Expected_status |
#      | testApiGetGemjar | get    | 200             |
#
  Scenario Outline: If Test Case Details are not found GEMPYP case
    Given Setttz token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | testApi2 | get    | 200             |

  Scenario Outline: If Test Case Details are not found GEMJAR case
    Given Setttz token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status |
      | testApiForGem | get    | 200             |
#
  Scenario Outline: If the User does not have access to any projects (testApi) GEMPYP case
    Given Set user wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status |
      | testApiGetGempyp | get    | 200             |

  Scenario Outline: If the User does not have access to any projects (testApi) GEMJAR case
    Given Set user wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status |
      | testApiGetGemjar | get    | 200             |
#
  Scenario Outline: If Suite Details are not found (testApi) GEMPYP case
    Given Set user wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | testApi3 | get    | 200             |

  Scenario Outline: If Suite Details are not found (testApi) GEMJAR case
    Given Set user wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status |
      | testApiForGem2 | get    | 200             |
#
  Scenario Outline: If Page No is invalid (testApi) GEMPYP case
    Given Set user wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | testApi4 | get    | 200             |

  Scenario Outline: If Page No is invalid (testApi) GEMJAR case
    Given Set user wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status |
      | testApiForGem3 | get    | 200             |

  Scenario Outline: API to the Test Case in the JSON Format GEMPYP case
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | jsonApiPyp | get    | 200             |

  Scenario Outline: API to the Test Case in the JSON Format GEMJAR case
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | jsonApiJar | get    | 200             |

  Scenario Outline: API to the Test Case in the JSON Format when user has no access GEMPYP case
    Given Set user wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | jsonApiPyp | get    | 200             |

  Scenario Outline: API to the Test Case in the JSON Format when user has no access GEMJAR case
    Given Set user wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | jsonApiJar | get    | 200             |

  Scenario Outline: API to the Test Case in the JSON Format when testcase detail are not found GEMPYP case
    Given Set user wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status |
      | jsonApiPyp1 | get    | 200             |

  Scenario Outline: API to the Test Case in the JSON Format when testcase detail are not found GEMJAR case
    Given Set user wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status |
      | jsonApiJar1 | get    | 200             |

  Scenario Outline:  API to get the List of Tests in the Application
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | SampleName    |
      | testApiForJar | post   | 200             | testApiForPyp |

  Scenario Outline:  API to import testcases to another suite GEMPYP case
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | SampleName     |
      | importTestCPyp | post   | 200             | importTestCPyp |

  Scenario Outline:  API to import testcases to another suite GEMJAR case
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | SampleName     |
      | importTestCJar | post   | 200             | importTestCJar |

  Scenario Outline:  API to import testcases to another suite  GEMPYP case when suite detail are not found
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | SampleName      |
      | importTestCPyp | post   | 200             | importTestCPyp2 |

  Scenario Outline:  API to import testcases to another suite  GEMJAR case when suite detail are not found
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | SampleName      |
      | importTestCJar | post   | 200             | importTestCPyp2 |

  Scenario Outline: API to Create the Test case in the Application when Framework is GEMPYP
    Given Setttt post array token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | testApi  | post   | 201             | testApi    |

  Scenario Outline: API to Create the Test case in the Application when Framework is GEMJAR
    Given Setttt post array token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | SampleName    |
      | testApiGemjar | post   | 201             | testApiGemjar |
#
  Scenario Outline: When the user does not have write access to the project (testApi) GEMPYP case
    Given Set post array user wrong token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | testApi  | post   | 200             | testApi    |

  Scenario Outline: When the user does not have write access to the project (testApi) GEMJAR case
    Given Set post array user wrong token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | SampleName    |
      | testApiGemjar | post   | 200             | testApiGemjar |
#
  Scenario Outline: Suite details are not found (testApi) GEMPYP case
    Given Setttt post array token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | testApi  | post   | 200             | testApi3   |

  Scenario Outline: Suite details are not found (testApi) GEMJAR case
    Given Setttt post array token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | SampleName     |
      | testApiGemjar | post   | 200             | testApiGemjar2 |
#

  Scenario Outline: API to update the Test Case in the Application (testApi) GEMPYP case
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | testApi  | put    | 201             | testApi4   |

  Scenario Outline: API to update the Test Case in the Application (testApi) GEMJAR case
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | SampleName     |
      | testApiGemjar | put    | 201             | testApiGemjar3 |

  Scenario Outline: When the user does not have write access to the project put case (testApi) GEMPYP case
    Given Set post user wrong token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | testApi  | put    | 200             | testApi4   |

  Scenario Outline: When the user does not have write access to the project put case (testApi) GEMJAR case
    Given Set post user wrong token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | SampleName     |
      | testApiGemjar | put    | 200             | testApiGemjar3 |

  Scenario Outline: Suite details are not found putcase (testApi) GEMPYP case
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | testApi  | put    | 200             | testApi6   |

  Scenario Outline: Suite details are not found putcase (testApi) GEMJAR case
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | SampleName     |
      | testApiGemjar | put    | 200             | testApiGemjar4 |
#
  Scenario Outline: Test Case details are not found (testApi) GEMPYP case
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | testApi  | put    | 200             | testApi7   |

  Scenario Outline: Test Case details are not found (testApi) GEMJAR case
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | SampleName     |
      | testApiGemjar | put    | 200             | testApiGemjar5 |
