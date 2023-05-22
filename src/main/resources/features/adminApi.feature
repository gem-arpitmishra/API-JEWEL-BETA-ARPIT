Feature: Admin

  Scenario Outline: API to create new Project (admin screen)
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName   |
      | adminApi1 | post   | 200             | adminScreen1 |

  Scenario Outline: API to create new Project when project already exists (admin screen)
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName   |
      | adminApi1 | post   | 200             | adminScreen2 |

  Scenario Outline: API to create new Project with no bearer token (admin screen)
    Given Set post empty token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName   |
      | adminApi1 | post   | 403             | adminScreen1 |
#
  @tag
  Scenario Outline: API to create new Project when project name left as empty (admin screen)
    Given Set post token without steps endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName   |
      | adminApi1 | post   | 400             | adminScreen3 |
#
  @tag
  Scenario Outline: API to create new Project when description is left as empty (admin screen)
    Given Set post token without steps endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName   |
      | adminApi1 | post   | 400             | adminScreen4 |
#
  @tag
  Scenario Outline: API to create new Project when enviroment is left as empty (admin screen)
    Given Set post token without steps endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName   |
      | adminApi1 | post   | 200             | adminScreen5 |

  Scenario Outline: API to update Project (admin screen)
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName   |
      | adminApi1 | put    | 200             | adminScreen6 |

  @tag
  Scenario Outline: API to update Project when project already exists (admin screen)
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName   |
      | adminApi1 | put    | 200             | adminScreen7 |

  @tag
  Scenario Outline: API to update Project when project name is empty (admin screen)
    Given Set post token without steps endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName   |
      | adminApi1 | put    | 400             | adminScreen8 |

  @tag
  Scenario Outline: API to update Project when description is empty (admin screen)
    Given Set post token without steps endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName   |
      | adminApi1 | put    | 400             | adminScreen9 |

  @tag
  Scenario Outline: API to update Project when enviroment is empty (admin screen)
    Given Set post token without steps endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName    |
      | adminApi1 | put    | 200             | adminScreen10 |

  Scenario Outline: API to update Project with no bearer token (admin screen)
    Given Set post empty token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName   |
      | adminApi1 | put    | 403             | adminScreen6 |

  @smoke
  Scenario Outline: API to Get Project Details (admin screen)
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status |
      | adminApi1 | get    | 200             |

  Scenario Outline: API to Get Project Details when user does not have access to projects (admin screen)
    Given Set token when user does not have access endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status |
      | adminApi1 | get    | 200             |

  Scenario Outline: API to Get Project Details when bridge token is wrong (admin screen)
    Given Set wrong bridge token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status |
      | adminApi1 | get    | 403             |

  @smoke
  Scenario Outline: API to Get User of Same (admin screen)
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status |
      | adminApi2 | get    | 200             |

  Scenario Outline: API to Get User of Same when user does not have access to projects (admin screen)
    Given Set token when user does not have access endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status |
      | adminApi2 | get    | 200             |

  Scenario Outline: API to Get User of Same when bridge token is wrong (admin screen)
    Given Set wrong bridge token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status |
      | adminApi2 | get    | 403             |

  @fail
  Scenario Outline: API To Request Role in Project requesting for QA (admin screen)
    Given Setttt post array token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName    |
      | adminApi5 | post   | 206             | adminScreen14 |

  @fail
  Scenario Outline: API To Request Role in Project requesting for DEV when you're already dev (admin screen)
    Given Setttt post array token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName    |
      | adminApi5 | post   | 200             | adminScreen15 |

#  Scenario Outline: API To Request Role in Project requesting for VIEWER (admin screen)
#    Given Setttt post array token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint  | Method | Expected_status | SampleName    |
#      | adminApi5 | post   | 200             | adminScreen16 |

#  Scenario Outline: API To Request Role in Project requesting for ADMIN when you're already ADMIN (admin screen)
#    Given Setttt post array token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint  | Method | Expected_status | SampleName    |
#      | adminApi5 | post   | 206             | adminScreen17 |

  Scenario Outline: API To Request Role in Project when PID is not found (admin screen)
    Given Setttt post array token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName    |
      | adminApi5 | post   | 200             | adminScreen19 |

  Scenario Outline: API To Request Role in Project leaving role as empty (admin screen)
    Given Setttt post array token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName    |
      | adminApi5 | post   | 206             | adminScreen18 |


  Scenario Outline: API To Request Role in Project when bearer token is empty (admin screen)
    Given Set bearer token as empty in case of array "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName    |
      | adminApi5 | post   | 403             | adminScreen14 |

  @smoke
  Scenario Outline: API To Get Requested Users (admin screen)
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status |
      | adminApi6 | get    | 200             |

  Scenario Outline: API To Get Requested Users when user does not have access to projects (admin screen)
    Given Set token when user does not have access endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status |
      | adminApi6 | get    | 200             |

  Scenario Outline: API To Get Requested Users when bridge token is wrong (admin screen)
    Given Set wrong bridge token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status |
      | adminApi6 | get    | 403             |

  @smoke
  Scenario Outline: API To Get Users on the project (admin screen)
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status |
      | adminApi7 | get    | 200             |

  Scenario Outline: API To Get Users on the project when user does not have access to projects (admin screen)
    Given Set token when user does not have access endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status |
      | adminApi7 | get    | 200             |

  Scenario Outline: API To Get Users on the project when bridge token is wrong (admin screen)
    Given Set wrong bridge token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status |
      | adminApi7 | get    | 403             |

  Scenario Outline: API To Change the Role Of User in the Project when role is ADMIN (admin screen)
    Given Setttt post array token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName    |
      | adminApi8 | post   | 200             | adminScreen20 |

  Scenario Outline: API To Change the Role Of User in the Project when role is QA (admin screen)
    Given Setttt post array token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName    |
      | adminApi8 | post   | 200             | adminScreen21 |

  Scenario Outline: API To Change the Role Of User in the Project when role is DEV (admin screen)
    Given Setttt post array token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName    |
      | adminApi8 | post   | 200             | adminScreen22 |

  Scenario Outline: API To Change the Role Of User in the Project when role is VIEWER (admin screen)
    Given Setttt post array token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName    |
      | adminApi8 | post   | 200             | adminScreen23 |

  Scenario Outline: API To Change the Role Of User in the Project when role is empty (admin screen)
    Given Setttt post array token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName    |
      | adminApi8 | post   | 206             | adminScreen24 |

  @fail
  Scenario Outline: API To Change the Role Of User in the Project when username is empty (admin screen)
    Given Setttt post array token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName    |
      | adminApi8 | post   | 206             | adminScreen25 |

  Scenario Outline: API To Change the Role Of User in the Project when bearer token is empty (admin screen)
    Given Set bearer token as empty in case of array "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName    |
      | adminApi8 | post   | 403             | adminScreen20 |

  Scenario Outline: API To Accept Request of the User (admin screen)
    Given Test accept API for admin screen "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<SampleName2>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | endpoint1 | endpoint2  | Method | Expected_status | SampleName    | SampleName1   | SampleName2   |
      | adminApi5 | adminApi9 | adminApi10 | post   | 200             | adminScreen26 | adminScreen27 | adminScreen28 |

  Scenario Outline: API To Accept Request of the User when bearer token is wrong (admin screen)
    Given Test accept with no bt API for admin screen "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>" and "<SampleName1>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | endpoint1 | Method | Expected_status | SampleName    | SampleName1   |
      | adminApi5 | adminApi9 | post   | 403             | adminScreen26 | adminScreen27 |

  Scenario Outline: API To Reject Request of the User (admin screen)
    Given Test decline API for admin screen "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>" and "<SampleName1>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | endpoint1  | Method | Expected_status | SampleName    | SampleName1   |
      | adminApi5 | adminApi11 | post   | 200             | adminScreen26 | adminScreen29 |

  Scenario Outline: API To Reject Request of the User when bt is wrong (admin screen)
    Given Test decline with no bt API for admin screen "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>" and "<SampleName1>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | endpoint1  | Method | Expected_status | SampleName    | SampleName1   |
      | adminApi5 | adminApi11 | post   | 403             | adminScreen26 | adminScreen29 |

  @smoke
  Scenario Outline: API TO GET Project details By Id (admin screen)
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi12 | get    | 200             |

  Scenario Outline: API TO GET Project details By Id when project details are not found (admin screen)
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi13 | get    | 200             |

  Scenario Outline: API TO GET Project details By Id when bearer token is wrong (admin screen)
    Given Set wrong bridge token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi12 | get    | 403             |

  Scenario Outline: Api to delete the project (admin screen)
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi15 | delete | 200             |

  Scenario Outline: Api to delete the project when project details are not found  (admin screen)
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi16 | delete | 200             |

  Scenario Outline: API TO GET Project details By Id when bearer token is wrong (admin screen)
    Given Set wrong bridge token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi15 | delete | 403             |

  Scenario Outline: Api to Delete User from company (admin screen)
    Given Set endpoint and method for blocking a user "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | endpoint1  | Method | Expected_status | SampleName    |
      | adminApi17 | adminApi18 | post   | 200             | adminScreen30 |

  Scenario Outline: Api to Delete User from company when username is wrong (admin screen)
    Given Set endpoint and method for blocking a user "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | endpoint1  | Method | Expected_status | SampleName    |
      | adminApi17 | adminApi18 | post   | 200             | adminScreen31 |

  Scenario Outline: Api to Delete User from company when username is passed as empty (admin screen)
    Given Set endpoint and method for blocking a user "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | endpoint1  | Method | Expected_status | SampleName    |
      | adminApi17 | adminApi18 | post   | 200             | adminScreen32 |

  Scenario Outline: Api to Delete User from company when bridge token is wrong (admin screen)
    Given Set endpoint and method for blocking a user with wrong bt "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | endpoint1  | Method | Expected_status | SampleName    |
      | adminApi17 | adminApi18 | post   | 403             | adminScreen30 |

  @smoke
  Scenario Outline: Api to get company admins in case of Super Admin
    Given Set endpoint and method in case of super admin "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi19 | get    | 200             |

  Scenario Outline: Api to get company admins in case of Super Admin when user is not super-admin
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi19 | get    | 200             |

  Scenario Outline: Api to get company admins in case of Super Admin when company name is INVALID
    Given Set endpoint and method in case of super admin "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi20 | get    | 200             |

  Scenario Outline: Api to get company admins in case of Super Admin when bridge token passed is wrong
    Given Set wrong bridge token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi19 | get    | 403             |

  @smoke
  Scenario Outline: Api to get the users of all the company by company name in case of Super Admin
    Given Set endpoint and method in case of super admin "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi21 | get    | 200             |

  Scenario Outline: Api to get the users of all the company by company name in case of Super Admin when user is not super-admin
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi21 | get    | 200             |

  Scenario Outline: Api to get the users of all the company by company name in case of Super Admin when company does not exist
    Given Set endpoint and method in case of super admin "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi22 | get    | 200             |

  Scenario Outline: Api to get the users of all the company by company name in case of Super Admin when bridge-token is wrong
    Given Set wrong bridge token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi19 | get    | 403             |

  Scenario Outline: Api to add company Admin
    Given Set post token endpoint and method in case of super admin "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | SampleName |
      | adminApi23 | post   | 200             | adminApi33 |

  Scenario Outline: Api to add company Admin when user is not super-admin
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | SampleName |
      | adminApi23 | post   | 200             | adminApi33 |

  Scenario Outline: Api to add company Admin when company name is left as empty
    Given Set post token endpoint and method in case of super admin "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | SampleName |
      | adminApi23 | post   | 200             | adminApi34 |

  Scenario Outline: Api to add company Admin when username is left as empty
    Given Set post token endpoint and method in case of super admin "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | SampleName |
      | adminApi23 | post   | 206             | adminApi35 |

  Scenario Outline: Api to add company Admin when bridge token is wrong
    Given Set post token endpoint and method in case of super admin when bt is wrong "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | SampleName |
      | adminApi23 | post   | 403             | adminApi33 |

  Scenario Outline: Api to remove company Admin
    Given Set post token endpoint and method in case of super admin "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | SampleName |
      | adminApi24 | post   | 200             | adminApi36 |

  Scenario Outline: Api to remove company Admin when user is not super-admin
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | SampleName |
      | adminApi24 | post   | 200             | adminApi36 |

  Scenario Outline: Api to remove company Admin when company name is left as empty
    Given Set post token endpoint and method in case of super admin "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | SampleName |
      | adminApi24 | post   | 200             | adminApi37 |

  Scenario Outline: Api to remove company Admin when username is left as empty
    Given Set post token endpoint and method in case of super admin "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | SampleName |
      | adminApi24 | post   | 206             | adminApi38 |

  Scenario Outline: Api to add company Admin when bridge token is wrong
    Given Set post token endpoint and method in case of super admin when bt is wrong "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | SampleName |
      | adminApi24 | post   | 403             | adminApi36 |

  Scenario Outline: Api to Add Unverified User in the company
    Given  Set Suite-API endpoint and method and SampleName for superAdmin "<endpoint>" and "<endpoint2>" and "<endpoint3>" and "<Method>" and "<SampleName>" and "<SampleName2>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | endpoint2  | endpoint3  | Method | Expected_status | SampleName                 | SampleName2 |
      | Post     | adminApi25 | adminApi26 | Post   | 200             | PostgeminiAdmin_sampleJson | adminApi39  |

  Scenario Outline: Api to Add Unverified User in the company (when username does not exist)
    Given  Set Suite-API endpoint and method and SampleName for superAdmin with no user "<endpoint>" and "<endpoint2>" and "<endpoint3>" and "<Method>" and "<SampleName>" and "<SampleName2>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | endpoint2  | endpoint3  | Method | Expected_status | SampleName                 | SampleName2 |
      | Post     | adminApi25 | adminApi26 | Post   | 200             | PostgeminiAdmin_sampleJson | adminApi39  |

  Scenario Outline: Api to Add Unverified User in the company (when user is already registered to another company)
    Given  Set Suite-API endpoint and method and SampleName for superAdmin with invalid user "<endpoint>" and "<endpoint2>" and "<endpoint3>" and "<Method>" and "<SampleName>" and "<SampleName2>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | endpoint2  | endpoint3  | Method | Expected_status | SampleName                 | SampleName2 |
      | Post     | adminApi25 | adminApi26 | Post   | 200             | PostgeminiAdmin_sampleJson | adminApi39  |

  @smoke
  Scenario Outline: Api To get company details when you're admin
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi27 | get    | 200             |

  Scenario Outline: Api To get company details when you're user
    Given Set token when user does not have access endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi27 | get    | 200             |

  Scenario Outline: Api To get company details when you're super-admin
    Given Set endpoint and method in case of super admin "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi27 | get    | 200             |

  Scenario Outline: Api To get domain details when you're admin
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi28 | get    | 200             |

  Scenario Outline: Api To get domain details when you're user
    Given Set token when user does not have access endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi28 | get    | 200             |

  Scenario Outline: Api To get domain details when you're admin but company does not exist
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi29 | get    | 200             |

#  Scenario Outline: Api To get domain details when you're super-admin
#    Given Set endpoint and method in case of super admin "<endpoint>" and "<Method>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint   | Method | Expected_status |
#      | adminApi30 | get    | 200             |

  Scenario Outline: Api To Get All company in case of super-admin
    Given Set endpoint and method in case of super admin "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi31 | get    | 200             |

  @smoke
  Scenario Outline: Api To Get All company in case of company-admin
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi31 | get    | 200             |

  Scenario Outline: Api to Create verified company
    Given Set post token endpoint and method in case of super admin "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | SampleName |
      | adminApi32 | post   | 200             | adminApi40 |

  Scenario Outline: Api to delete created company
    Given Set post token endpoint and method in case of super admin "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | SampleName    |
      | deleteCompanyApi | post   | 200             | deleteCompany |

  Scenario Outline: Api to Create verified company in case when company already exists
    Given Set post token endpoint and method in case of super admin "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | SampleName |
      | adminApi32 | post   | 200             | adminApi41 |

  Scenario Outline: Api to Create verified company in case when domain already exists
    Given Set post token endpoint and method in case of super admin "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | SampleName |
      | adminApi32 | post   | 200             | adminApi42 |

  Scenario Outline: Api to Create verified company in case of company-admin
    Given Set post token endpoint and method "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | SampleName |
      | adminApi32 | post   | 200             | adminApi41 |

  Scenario Outline: Api to Verify company name
    Given Set endpoint and method in case of super admin "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi33 | get    | 200             |

  Scenario Outline: Api to Verify company name in case of company-admin
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi33 | get    | 200             |

  Scenario Outline: Api to Verify company name when company name does not exist
    Given Set endpoint and method in case of super admin "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi34 | get    | 200             |

  @smoke
  Scenario Outline: Api to get company users in case of super-admin
    Given Set endpoint and method in case of super admin "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi36 | get    | 200             |

  Scenario Outline: Api to get company users in case of company-admin
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi35 | get    | 200             |

  Scenario Outline: Api to get company users in case of user
    Given Set token when user does not have access endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi35 | get    | 200             |


  Scenario Outline: Api to get Deleted users in case of company-admin
    Given Set endpoint and method for blocking a user and get "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<Method1>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | endpoint1  | endpoint2  | Method | Method1 | Expected_status | SampleName    |
      | adminApi17 | adminApi18 | adminApi37 | post   | get     | 200             | adminScreen30 |

  Scenario Outline: Api to get Deleted users in case of user
    Given Set token when user does not have access endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi37 | get    | 200             |

  @smoke
  Scenario Outline: Api to get company admin in case of super-admin
    Given Set endpoint and method in case of super admin "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi38 | get    | 200             |

  Scenario Outline: Api to get company admin in case of company-admin
    Given Set token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi38 | get    | 200             |

  Scenario Outline: Api to get company admin when company name is not found
    Given Set endpoint and method in case of super admin "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status |
      | adminApi39 | get    | 200             |



























































