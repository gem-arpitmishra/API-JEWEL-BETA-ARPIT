Feature: gitApi

  Scenario Outline: API to import GemJar Test Cases from git
    Given Sett posttt token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | gitApi   | post   | 201             | gitSample  |

  Scenario Outline: API to import GemJar Test Cases from git when suite does not exist
    Given Sett posttt token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | gitApi   | post   | 200             | gitSample2 |

  Scenario Outline: API to import GemJar Test Cases from git when user does not have write access to the project
    Given Sett posttt token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | gitApi   | post   | 200             | gitSample3 |
#
  Scenario Outline: API to import GemJar Test Cases from git when url provided is wrong
    Given Sett posttt token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | gitApi   | post   | 200             | gitSample4 |

  Scenario Outline: API to update import GemJar Test Cases from git
    Given Sett posttt token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | gitApi   | put    | 200             | gitSample  |

  Scenario Outline: API to update GemJar Test Cases from git
    Given Sett posttt token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | gitApi   | put    | 200             | gitSample  |

  Scenario Outline: API to update GemJar Test Cases from git when suite does not exist
    Given Sett posttt token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | gitApi   | put    | 200             | gitSample2 |

  Scenario Outline: API to update GemJar Test Cases from git when user does not have write access to the project
    Given Sett posttt token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | gitApi   | put    | 200             | gitSample3 |

  Scenario Outline: API to update GemJar Test Cases from git when url provided is wrong
    Given Sett posttt token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName |
      | gitApi   | put    | 200             | gitSample4 |

  Scenario Outline: API to delete import GemJar Test Cases from git
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status |
      | gitApiDelete | delete | 200             |

  Scenario Outline: API to delete import GemJar Test Cases from git when user does not have access
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status |
      | gitApiDelete3 | delete | 200             |
