Feature: suiteExeApi

  Scenario Outline: Insert Test-Suite Using Post APIs
    Given Set Suite-API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName        |
      | pospo    | Post   | 201             | psuite_sampleJson |

  Scenario Outline: Insert the suite using Post API when S-run-id is already present
    Given Set Suite-API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName         |
      | pospo    | Post   | 400             | psuite1_sampleJson |

  Scenario Outline: Insert the Suite using post API when S-run-id not present in the payload
    Given Set Suite-API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName         |
      | pospo    | Post   | 201             | psuite2_sampleJson |

  Scenario Outline: Insert the Suite using Wrong Authentication
    Given Set Suite-API using Wrong Authentication endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName         |
      | pospo    | Post   | 403             | psuite2_sampleJson |

  Scenario Outline: Insert the Suite when Headers not given
    Given Set Suite-API when headers not given endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName         |
      | pospo    | Post   | 400             | psuite2_sampleJson |


  Scenario Outline: Update the suite using Put API (suitexe case)
    Given Update Suite using endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName       |
      | putu     | put    | 200             | put_1_sampleJson |

  Scenario Outline: Update the suite When S-run-id is not present in Database
    Given Update Suite when S-run-id not present using endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName       |
      | putu     | put    | 400             | put_2_sampleJson |

  Scenario Outline: Update the suite Using Wrong Authentication
    Given Update Suite using wrong Authentication using endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName       |
      | putu     | put    | 403             | put_2_sampleJson |

  Scenario Outline: Update the suite without Authentication
    Given Update Suite without Authentication using endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName       |
      | putu     | put    | 400             | put_2_sampleJson |