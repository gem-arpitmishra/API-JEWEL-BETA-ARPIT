Feature: suiteApi

  @smoke
  Scenario Outline: API to get the List of Suites in the Application
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status |
      | suiteApiGet | get    | 200             |

  Scenario Outline: If the User does not have access to any projects (suiteApi)
    Given Set user wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status |
      | suiteApiGet | get    | 200             |

  Scenario Outline: If Page No is invalid
    Given Setttz token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status |
      | suiteApi3 | get    | 200             |

  Scenario Outline: API to get the List of Suites in the Application when wrong authentication passed
    Given Set Wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status |
      | suiteApiGet | get    | 403             |

  Scenario Outline: API to get the List of Suites in the Application when header is not given
    Given Set Empty token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status |
      | suiteApiGet | get    | 403             |

#  @smoke
  Scenario Outline: API to Create the Suite in the Application
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | suiteApi | post   | 201             | suiteApi   |

  Scenario Outline: When the user does not have write access to the project
    Given Set post user wrong token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | suiteApi | post   | 200             | suiteApi   |


  Scenario Outline: API to update the Suite in the Application (suiteApi)
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | suiteApi | put    | 201             | suiteApi3  |

  Scenario Outline: When the user does not have write access to the project put case (suiteApi)
    Given Set post user wrong token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | suiteApi | put    | 200             | suiteApi3  |


  Scenario Outline: s_id is not present in request (suiteApi)
    Given Sett posttt token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | suiteApi | put    | 200             | suiteApi5  |

  Scenario Outline: s_id is not present in request (suiteApi)
    Given Sett posttt token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | suiteApi | put    | 200             | suiteApi5  |