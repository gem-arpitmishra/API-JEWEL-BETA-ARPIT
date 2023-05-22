Feature: postTokenApi

  Scenario Outline: Change Token
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status |
      | posttoken | Post   | 200             |

  Scenario Outline: Change Token When Header is not Given
    Given Set Empty token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status |
      | posttoken | Post   | 403             |

  Scenario Outline: Change Token wih wrong Authentication
    Given Set Wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status |
      | posttoken | Post   | 403             |