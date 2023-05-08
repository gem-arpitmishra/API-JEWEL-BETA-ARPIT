Feature: moduleApi

  Scenario Outline: Post Module (POST)
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | SampleName |
      | postModuleApi | post   | 201             | postModule |

  @smoke
  Scenario Outline: Get Module name list (GET)
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status |
      | getModuleApi | get    | 200             |
#
  Scenario Outline: Get Module name list (GET) with no bearer token
    Given Set emptyyy token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status |
      | getModuleApi | get    | 403             |

  Scenario Outline: Module already exists (409 CONFLICT)
    Given Set posttt token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | SampleName  |
      | postModuleApi | post   | 409             | postModule1 |
#
  Scenario Outline: Update Module (PUT)
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | SampleName |
      | postModuleApi | put    | 200             | putModule  |

  Scenario Outline: Update Module (PUT) with no bearer token
    Given Set post empty token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | SampleName |
      | postModuleApi | put    | 403             | putModule  |
#
  Scenario Outline: Module already exists (409 CONFLICT) PUT case
    Given Set posttt token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | SampleName |
      | postModuleApi | put    | 409             | putModule1 |