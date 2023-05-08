Feature: bucketApi

  @smoke
  Scenario Outline: File upload with Correct BridgeToken
    Given Set endpointt "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | endpoint1       | Method | SampleName                 | Expected_status |
      | fileUpload1 | permanentDelete | post   | permanentDelete_sampleJson | 200             |

  Scenario Outline: File upload with s_run
    Given Set endpointt "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint           | endpoint1       | Method | SampleName                 | Expected_status |
      | fileUploadWithSrun | permanentDelete | post   | permanentDelete_sampleJson | 200             |

  Scenario Outline: File upload with s_run when tag is incorrect
    Given Set endpointt "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint            | endpoint1       | Method | SampleName                 | Expected_status |
      | fileUploadWithSrun1 | permanentDelete | post   | permanentDelete_sampleJson | 400             |

  Scenario Outline: File upload with file s_run with url and user has no access
    Given Set posterr user wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status |
      | fileUploadCheck | get    | 404             |
#
  Scenario Outline: File upload with incorrect tag
    Given Set endpointt "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | endpoint1       | Method | SampleName                 | Expected_status |
      | fileUpload2 | permanentDelete | post   | permanentDelete_sampleJson | 400             |

  Scenario Outline: File upload with incorrect BridgeToken
    Given Set endpoint with incorrect bridgetoken "<endpoint>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Expected_status |
      | fileUpload1 | 403             |

  Scenario Outline: File upload with Bearer token
    Given Set endpoint without username "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | endpoint1       | Method | SampleName                 | Expected_status |
      | fileUpload1 | permanentDelete | post   | permanentDelete_sampleJson | 200             |

  Scenario Outline: File upload with Bearer token is not present in username
    Given Set endpoint without username in Bearer Token "<endpoint>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Expected_status |
      | fileUpload1 | 403             |

  Scenario Outline: File upload when username is not present in the DataBase
    Given Set endpoint with username not present in db "<endpoint>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Expected_status |
      | fileUpload1 | 403             |

########################## Bucket APIs-2 ###################################

  @smoke
  Scenario Outline: File upload by text
    Given Set endpoint with text "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | endpoint1       | Method | SampleName                 | Expected_status |
      | fileUpload3 | permanentDelete | post   | permanentDelete_sampleJson | 200             |

  Scenario Outline: File upload by text with s_run
    Given Set endpoint with text "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint            | endpoint1       | Method | SampleName                 | Expected_status |
      | fileUpload3WithSrun | permanentDelete | post   | permanentDelete_sampleJson | 200             |

  Scenario Outline: File upload with data with s_run with url and user has no access
    Given Set posterr user wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status |
      | fileUploadCheck2 | get    | 404             |

  Scenario Outline: File upload by text with incorrect tag
    Given Set endpoint with text wrong tag "<endpoint>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Expected_status |
      | fileUpload4 | 400             |

  Scenario Outline: File upload by text with wrong bridge token
    Given Set endpoint with text with wrong BridgeToken "<endpoint>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Expected_status |
      | fileUpload3 | 403             |

  Scenario Outline: File upload by text when Bearer token is not present in username
    Given Set endpoint with text when BT is not present "<endpoint>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Expected_status |
      | fileUpload3 | 403             |

  Scenario Outline: File upload by text when username is not present in DB
    Given Set endpoint with text without valid username "<endpoint>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Expected_status |
      | fileUpload3 | 403             |

  @fail
  Scenario Outline: File upload by text without permission
    Given Set endpoint with text wrong tag "<endpoint>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Expected_status |
      | fileUpload6 | 401             |

  @fail
  Scenario Outline: File upload by text without write access
    Given Set endpoint with text without write access "<endpoint>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Expected_status |
      | fileUpload6 | 401             |

######################## Bucket APIs-3 ###################################
  ################################have to call this#######################
  @smoke
  Scenario Outline:Get file back from recycle bin
    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | endpoint1   | endpoint2       | Method | Expected_status | SampleName           | SampleName1                | stepName                     |
      | changeTag | fileUpload3 | permanentDelete | Post   | 200             | publicTag_sampleJson | permanentDelete_sampleJson | Test to change tag to public |
  ########################################################################

  Scenario Outline:Give WRITE access of the files to the users
    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | endpoint1   | endpoint2       | Method | Expected_status | SampleName        | SampleName1                | stepName                     |
      | access   | fileUpload3 | permanentDelete | Post   | 200             | Access_sampleJson | permanentDelete_sampleJson | Test to change tag to public |

  Scenario Outline:Give READ access of the files to the users
    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | endpoint1   | endpoint2       | Method | Expected_status | SampleName        | SampleName1                | stepName                     |
      | access1  | fileUpload3 | permanentDelete | Post   | 200             | Access_sampleJson | permanentDelete_sampleJson | Test to change tag to public |

  Scenario Outline:Remove WRITE access of the files to the users
    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | endpoint1   | endpoint2       | Method | Expected_status | SampleName        | SampleName1                | stepName                     |
      | access2  | fileUpload3 | permanentDelete | Post   | 200             | Access_sampleJson | permanentDelete_sampleJson | Test to change tag to public |

  Scenario Outline:Remove READ access of the files to the users
    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | endpoint1   | endpoint2       | Method | Expected_status | SampleName        | SampleName1                | stepName                     |
      | access3  | fileUpload3 | permanentDelete | Post   | 200             | Access_sampleJson | permanentDelete_sampleJson | Test to change tag to public |

  Scenario Outline:Give WRITE access of the files to the users when mode provided is incorrect
    Given Post Suite-API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName        |
      | access4  | Post   | 400             | Access_sampleJson |

  Scenario Outline:Remove READ access of the files to the users when the type provided is incorrect
    Given Post Suite-API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName        |
      | access5  | Post   | 400             | Access_sampleJson |

  Scenario Outline:Give WRITE access of the files to the users when Bridge Token is not valid
    Given Set Post API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName        |
      | access   | Post   | 403             | Access_sampleJson |

  Scenario Outline:Give WRITE access of the files to the users when username is not found in Bearer token
    Given Set Post API without BT endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | SampleName        |
      | access   | Post   | 403             | Access_sampleJson |

   ######################## Bucket APIs-4 ###################################

  @smoke
  Scenario Outline:Give access of the folder to the users
    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | endpoint1   | endpoint2       | Method | Expected_status | SampleName              | SampleName1                | stepName                           |
      | folderAccess | fileUpload3 | permanentDelete | Post   | 200             | folderAccess_sampleJson | permanentDelete_sampleJson | Test to give folder access to user |

  @fail
  Scenario Outline:Remove access of the folder from the users
    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | endpoint1   | endpoint2       | Method | Expected_status | SampleName              | SampleName1                | stepName                             |
      | folderAccess1 | fileUpload3 | permanentDelete | Post   | 200             | folderAccess_sampleJson | permanentDelete_sampleJson | Test to remove folder access to user |

  Scenario Outline:Remove access of the folder from the users when type provided is incorrect
    Given Post Suite-API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | SampleName              |
      | folderAccess2 | Post   | 400             | folderAccess_sampleJson |

  Scenario Outline:Give access of the folder to the users when Bridge Token is not valid
    Given Set Post API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status | SampleName              |
      | folderAccess | Post   | 403             | folderAccess_sampleJson |

  Scenario Outline:Give access of the folder to the users when username is not found in Bearer token
    Given Set Post API without BT endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status | SampleName              |
      | folderAccess | Post   | 403             | folderAccess_sampleJson |

     ######################## Bucket APIs-5 ###################################

  @smoke
  Scenario Outline:Change tag to public
    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | endpoint1   | endpoint2       | Method | Expected_status | SampleName           | SampleName1                | stepName                     |
      | changeTag | fileUpload3 | permanentDelete | Post   | 200             | publicTag_sampleJson | permanentDelete_sampleJson | Test to change tag to public |

  Scenario Outline:Change tag to private
    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | endpoint1   | endpoint2       | Method | Expected_status | SampleName            | SampleName1                | stepName                     |
      | changeTag | fileUpload3 | permanentDelete | Post   | 200             | privateTag_sampleJson | permanentDelete_sampleJson | Test to change tag to public |

  Scenario Outline:Change tag to public when Bridge Token is not valid
    Given Set Post API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName           |
      | changeTag | Post   | 403             | publicTag_sampleJson |

  Scenario Outline:Change tag to public when username is not found in Bearer token
    Given Set Post API without BT endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName           |
      | changeTag | Post   | 403             | publicTag_sampleJson |

  Scenario Outline:Change tag to public when tag provided is incorrect
    Given Post Suite-API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName            |
      | changeTag | Post   | 206             | publicTag2_sampleJson |

   ######################## Bucket APIs-6 ###################################

  @fail
  Scenario Outline:Moving the files to the recycle bin
    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | endpoint1   | endpoint2       | Method | Expected_status | SampleName           | SampleName1                | stepName                     |
      | deleteTag | fileUpload3 | permanentDelete | Post   | 200             | deleteTag_sampleJson | permanentDelete_sampleJson | Test to change tag to public |

  Scenario Outline:Moving the files to the recycle bin when Bridge Token is not valid
    Given Set Post API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName           |
      | deleteTag | Post   | 403             | deleteTag_sampleJson |

  Scenario Outline:Moving the files to the recycle bin when username is not found in Bearer token
    Given Set Post API without BT endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName           |
      | deleteTag | Post   | 403             | deleteTag_sampleJson |

  Scenario Outline:Moving the files to the recycle bin when tag provided is incorrect
    Given Post Suite-API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | SampleName            |
      | deleteTag | Post   | 206             | deleteTag2_sampleJson |

#      ######################## Bucket APIs-7 ###################################
#
  Scenario Outline:Get the file from recycle bin
    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | endpoint1   | endpoint2       | Method | Expected_status | SampleName            | SampleName1                | stepName                     |
      | deleteTag | fileUpload3 | permanentDelete | Post   | 200             | deleteTag3_sampleJson | permanentDelete_sampleJson | Test to change tag to public |

  Scenario Outline:Deleting the Files Permanently
    Given Post Suite-API endpointt and methodd and SampleNamee and step "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>" and "<stepName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | endpoint1   | Method | Expected_status | SampleName                 | stepName                               |
      | permanentDelete | fileUpload3 | Post   | 200             | permanentDelete_sampleJson | Test to Deleting the Files Permanently |
#
  Scenario Outline:Deleting the Files Permanently when Bridge Token is not valid
    Given Set Post API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | SampleName                 |
      | permanentDelete | Post   | 403             | permanentDelete_sampleJson |

  Scenario Outline:Deleting the Files Permanently when username is not found in Bearer token
    Given Set Post API without BT endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | SampleName                 |
      | permanentDelete | Post   | 403             | permanentDelete_sampleJson |

      ######################## Bucket APIs-8 ###################################
  Scenario Outline: File upload before moving to recycle bin
    Given Set endpointt "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | endpoint1       | Method | SampleName                 | Expected_status |
      | fileUpload1 | permanentDelete | post   | permanentDelete_sampleJson | 200             |

  Scenario Outline: File upload again by text
    Given Set endpoint with text "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | endpoint1       | Method | SampleName                 | Expected_status |
      | fileUpload3 | permanentDelete | post   | permanentDelete_sampleJson | 200             |

  Scenario Outline:Moving the files to the recycle bin before getting
    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | endpoint1   | endpoint2       | Method | Expected_status | SampleName           | SampleName1                | stepName                     |
      | deleteTag | fileUpload3 | permanentDelete | Post   | 200             | deleteTag_sampleJson | permanentDelete_sampleJson | Test to change tag to public |

  Scenario Outline:Get the Files which are in recycle bin
    Given Sett token endpoint and method "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<endpoint3>" and "<Method>" and "<Method1>" and "<SampleName>" and "<SampleName2>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | endpoint1   | endpoint2 | endpoint3       | Method | Method1 | SampleName           | SampleName2                | Expected_status |
      | getrecyclebin | fileUpload3 | deleteTag | permanentDelete | get    | post    | deleteTag_sampleJson | permanentDelete_sampleJson | 200             |

  Scenario Outline: Get the Files which are in recycle bin when Bridge Token is not valid
    Given Set Wrong token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status |
      | getrecyclebin | get    | 403             |

  Scenario Outline:Get the Files which are in recycle bin when username is not found in Bearer token
    Given Set endpoint and method without bearer token "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status |
      | getrecyclebin | get    | 403             |

  @fail
  Scenario Outline:Get the Files when there is no file in recycle bin
    Given Setting token endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status |
      | getrecyclebin | get    | 404             |

###       ######################## Bucket APIs-9 ###################################

  @smoke
  Scenario Outline:Get the Files when files are public
    Given Get file by setting Authentication: endpoint and method "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<Method1>" and "<SampleName>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | endpoint1   | endpoint2       | Method | Method1 | SampleName                 | Expected_status |
      | getFile  | fileUpload3 | permanentDelete | get    | post    | permanentDelete_sampleJson | 200             |

  @fail
  Scenario Outline:Get the Files when it is private with Authentication
    Given Gett file by settingg Authentication: endpoint and method "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<endpoint3>" and "<Method>" and "<Method1>" and "<SampleName>" and "<SampleName1>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | endpoint1   | endpoint2       | endpoint3 | Method | Method1 | SampleName                 | SampleName1           | Expected_status |
      | getFile  | fileUpload3 | permanentDelete | changeTag | get    | post    | permanentDelete_sampleJson | privateTag_sampleJson | 200             |
#
  Scenario Outline:Get the Files when username is not found in token and file is private.
    Given Get file by setting endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | getFile  | get    | 404             |

  Scenario Outline:Get the Files when file is in recycle bin.
    Given Get file by setting Authentication, endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | getFile  | get    | 404             |

  Scenario Outline:Get the Files when file not found
    Given Get file by setting Authentication, endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | getFile  | get    | 404             |

  Scenario Outline:Get the Files when file is private and user not have permission to see it.
    Given Get file by setting Authentication, endpoint and method "<endpoint>" and "<Method>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | getFile  | get    | 404             |
