Feature: testCaseApi

  Scenario Outline:Create new record for Testcases
    Given Create record using endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName       |
      | pospos   | post   | 201             | ptest_sampleJson |

  Scenario Outline:Create new record for Testcases when S-run-id not exists in database
    Given Create record when s-id not exists using endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName        |
      | pospos   | post   | 400             | ptest1_sampleJson |

  Scenario Outline:Create new record for Testcases when S-run-id not given
    Given Create record when s-id not given using endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName        |
      | pospos   | post   | 400             | ptest2_sampleJson |

  Scenario Outline:Create new record for Testcases when TC-run-id not given
    Given Create record when TC-id not given using endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName        |
      | pospos   | post   | 201             | ptest3_sampleJson |

  Scenario Outline:Create new record for Testcases with wrong Authentication
    Given Create record with wrong Authentication using endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName        |
      | pospos   | post   | 400             | ptest3_sampleJson |

  Scenario Outline:Create new record for Testcases when authentication not given
    Given Create record when authentication not given using endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName        |
      | pospos   | post   | 400             | ptest3_sampleJson |

  Scenario Outline: Update the suite using Put API (testcase case)
    Given Update Suite type2 using endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName        |
      | putexe   | put    | 200             | puter1_sampleJson |

  Scenario Outline: Update the Testcase data when S-run-id not given
    Given Update Suite without s-runid using endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName        |
      | putexe   | put    | 400             | puter2_sampleJson |
#
  Scenario Outline: Update the suite when TC-id not given
    Given Update Suite without tc-id using endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName        |
      | putexe   | put    | 400             | puter3_sampleJson |

  Scenario Outline: Update the testcase data using wrong authentication
    Given Update Suite using wrong Authentication using endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName        |
      | putexe   | put    | 403             | puter3_sampleJson |

