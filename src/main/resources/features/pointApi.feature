Feature: pointApi

  @smoke
  Scenario Outline: API to get the base URLs of the Application
    Given sett tokenn endpointt and methodd "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | pointApi | get    | 200             |

  Scenario Outline: API to get the base URLs of the Application when bt is wrong
    Given sett tokenn endpointt and methoddd "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | pointApi | get    | 403             |

  @smoke
  Scenario Outline: Last api(GET)
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status |
      | lastFiveApi | get    | 200             |

  Scenario Outline: Last 5 Suites when s_run_id is not valid
    Given sett tokenn endpointt and methodd "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status |
      | lastFiveApi1 | get    | 400             |