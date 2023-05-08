Feature: ruleApi

#  Scenario Outline: Post Rules(POST)
#    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint    | Method | Expected_status | SampleName    |
#      | postRuleApi | post   | 200             | postRuleApiis |

  Scenario Outline: Post Rules(POST) when report id is invalid
    Given Sett posttt token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status | SampleName     |
      | postRuleApi | post   | 200             | postRuleApiis1 |

  Scenario Outline: Post Rules(POST) with no bearer token
    Given Set post empty token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | SampleName    |
      | postModuleApi | post   | 403             | postRuleApiis |

  @smoke
  Scenario Outline: Get Rule Action(GET)
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status |
      | getRuleApis | get    | 200             |

  Scenario Outline: Get Rule Action(GET) when header is not given
    Given Set Empty token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status |
      | getRuleApis | get    | 403             |

  Scenario Outline: Get Rule Action(GET) when wrong authentication passed
    Given Set Wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status |
      | getRuleApis | get    | 403             |

  Scenario Outline: Get Rule Action(GET) when s_run_id is wrong
    Given Setttz token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status |
      | getRuleApis11 | get    | 200             |