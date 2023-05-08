Feature: getApi

  @smoke
  Scenario Outline: Get Company
    Given Set endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | Getc     | get    | 200             |

  Scenario Outline: Validate UserName
    Given Set endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | Gett     | get    | 200             |

  Scenario Outline: Validate Username when username does not exists
    Given Set endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | Gett2    | get    | 200             |
#
  Scenario Outline: Get data of suite s-run id not present
    Given Authenticate endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | Gettte   | get    | 400             |
#
  @smoke
  Scenario Outline: Get Token
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | Gettoken | get    | 200             |

  Scenario Outline: Get Token With Wrong Authentication
    Given Set Wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | Gettoken | get    | 403             |

  Scenario Outline: Get Token With Empty Authentication
    Given Set Empty token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | Gettoken | get    | 403             |