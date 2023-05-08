#Feature: azureApi
##
#  Scenario Outline: (Azure Bucket APIs) File upload
#    Given Set endpoint without usernames "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint       | endpoint1            | Method | SampleName                 | Expected_status |
#      | azureBucketApi | azurePermanentDelete | post   | permanentDelete_sampleJson | 200             |
#
#  Scenario Outline: (Azure Bucket APIs) File upload with s_run
#    Given Set endpoint without usernames "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint               | endpoint1            | Method | SampleName                 | Expected_status |
#      | azureBucketApiWithSRun | azurePermanentDelete | post   | permanentDelete_sampleJson | 200             |
#
#  Scenario Outline: (Azure Bucket APIs) File upload with incorrect s_run
#    Given Set endpoint without usernames "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint                | endpoint1            | Method | SampleName                 | Expected_status |
#      | azureBucketApiWithSRun1 | azurePermanentDelete | post   | permanentDelete_sampleJson | 400             |
#
#  Scenario Outline: (Azure Bucket APIs) File upload with incorrect tag
#    Given Set endpoint without usernames "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint        | endpoint1            | Method | SampleName                 | Expected_status |
#      | azureBucketApi1 | azurePermanentDelete | post   | permanentDelete_sampleJson | 400             |
#
#  Scenario Outline: (Azure Bucket APIs) File upload with Bearer token is not present in username
#    Given Set endpoint without username in Bearer Token "<endpoint>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint       | Expected_status |
#      | azureBucketApi | 403             |
#
#  Scenario Outline: (Azure Bucket APIs) File upload when username is not present in the DataBase
#    Given Set endpoint with username not present in db "<endpoint>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint       | Expected_status |
#      | azureBucketApi | 403             |
#
#  Scenario Outline: (Azure Bucket APIs) File upload by text
#    Given Set endpoint with text "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint        | endpoint1            | Method | SampleName                 | Expected_status |
#      | azureBucketApi2 | azurePermanentDelete | post   | permanentDelete_sampleJson | 200             |
#
#  Scenario Outline: (Azure Bucket APIs) File upload by text with s_run
#    Given Set endpoint with text "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint                | endpoint1            | Method | SampleName                 | Expected_status |
#      | azureBucketApi2WithSrun | azurePermanentDelete | post   | permanentDelete_sampleJson | 200             |
#
#  Scenario Outline: (Azure Bucket APIs) File upload by text with incorrect tag
#    Given Set endpoint with text wrong tag "<endpoint>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint        | Expected_status |
#      | azureBucketApi3 | 400             |
#
#  Scenario Outline: (Azure Bucket APIs) File upload with data with s_run with url and user has no access
#    Given Set posting user wrong token endpoint and method "<endpoint>" and "<Method>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint            | Method | Expected_status |
#      | azureBucketApiCheck | post   | 401             |
#
#  Scenario Outline: (Azure Bucket APIs) File upload by text with wrong bridge token
#    Given Set endpoint with text with wrong BridgeToken "<endpoint>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint        | Expected_status |
#      | azureBucketApi2 | 403             |
#
#  Scenario Outline: (Azure Bucket APIs) File upload by text when Bearer token is not present in username
#    Given Set endpoint with text when BT is not present "<endpoint>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint        | Expected_status |
#      | azureBucketApi2 | 403             |
#
#  Scenario Outline: (Azure Bucket APIs) File upload by text when username is not present in DB
#    Given Set endpoint with text without valid username "<endpoint>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint        | Expected_status |
#      | azureBucketApi2 | 403             |
#
#  Scenario Outline: (Azure Bucket APIs) Give WRITE access of the files to the users
#    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint    | endpoint1       | endpoint2            | Method | Expected_status | SampleName        | SampleName1                | stepName                     |
#      | azureAccess | azureBucketApi2 | azurePermanentDelete | Post   | 200             | Access_sampleJson | permanentDelete_sampleJson | Test to change tag to public |
#
#  Scenario Outline: (Azure Bucket APIs) Give READ access of the files to the users
#    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint     | endpoint1       | endpoint2            | Method | Expected_status | SampleName        | SampleName1                | stepName                     |
#      | azureAccess1 | azureBucketApi2 | azurePermanentDelete | Post   | 200             | Access_sampleJson | permanentDelete_sampleJson | Test to change tag to public |
#
#  Scenario Outline: (Azure Bucket APIs) Remove READ access of the files to the users
#    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint     | endpoint1       | endpoint2            | Method | Expected_status | SampleName        | SampleName1                | stepName                     |
#      | azureAccess2 | azureBucketApi2 | azurePermanentDelete | Post   | 200             | Access_sampleJson | permanentDelete_sampleJson | Test to change tag to public |
#
#  Scenario Outline: (Azure Bucket APIs) Remove WRITE access of the files to the users
#    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint     | endpoint1       | endpoint2            | Method | Expected_status | SampleName        | SampleName1                | stepName                     |
#      | azureAccess3 | azureBucketApi2 | azurePermanentDelete | Post   | 200             | Access_sampleJson | permanentDelete_sampleJson | Test to change tag to public |
#
#  Scenario Outline: (Azure Bucket APIs) Give WRITE access of the files to the users when mode provided is incorrect
#    Given Post Suite-API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint     | Method | Expected_status | SampleName        |
#      | azureAccess4 | Post   | 400             | Access_sampleJson |
#
#  Scenario Outline:(Azure Bucket APIs) Remove READ access of the files to the users when the type provided is incorrect
#    Given Post Suite-API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint     | Method | Expected_status | SampleName        |
#      | azureAccess5 | Post   | 400             | Access_sampleJson |
#
#  Scenario Outline: (Azure Bucket APIs) Give WRITE access of the files to the users when Bridge Token is not valid
#    Given Set Post API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint    | Method | Expected_status | SampleName        |
#      | azureAccess | Post   | 403             | Access_sampleJson |
#
#  Scenario Outline: (Azure Bucket APIs) Give WRITE access of the files to the users when username is not found in Bearer token
#    Given Set Post API without BT endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint    | Method | Expected_status | SampleName        |
#      | azureAccess | Post   | 403             | Access_sampleJson |
#
#  Scenario Outline: (Azure Bucket APIs) Give access of the folder to the users
#    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint          | endpoint1       | endpoint2            | Method | Expected_status | SampleName              | SampleName1                | stepName                           |
#      | azureFolderAccess | azureBucketApi2 | azurePermanentDelete | Post   | 200             | folderAccess_sampleJson | permanentDelete_sampleJson | Test to give folder access to user |
#
#  Scenario Outline: (Azure Bucket APIs) Remove access of the folder from the users
#    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint           | endpoint1       | endpoint2            | Method | Expected_status | SampleName              | SampleName1                | stepName                             |
#      | azureFolderAccess2 | azureBucketApi2 | azurePermanentDelete | Post   | 200             | folderAccess_sampleJson | permanentDelete_sampleJson | Test to remove folder access to user |
#
#  Scenario Outline: (Azure Bucket APIs) Remove access of the folder from the users when type provided is incorrect
#    Given Post Suite-API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint           | Method | Expected_status | SampleName              |
#      | azureFolderAccess3 | Post   | 400             | folderAccess_sampleJson |
#
#  Scenario Outline: (Azure Bucket APIs) Give access of the folder to the users when Bridge Token is not valid
#    Given Set Post API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint          | Method | Expected_status | SampleName              |
#      | azureFolderAccess | Post   | 403             | folderAccess_sampleJson |
#
#  Scenario Outline: (Azure Bucket APIs) Give access of the folder to the users when username is not found in Bearer token
#    Given Set Post API without BT endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint          | Method | Expected_status | SampleName              |
#      | azureFolderAccess | Post   | 403             | folderAccess_sampleJson |
#
#  Scenario Outline: (Azure Bucket APIs) Give access of the folder to the users when folder is not present in DB
#    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint          | endpoint1       | endpoint2            | Method | Expected_status | SampleName | SampleName1                | stepName                           |
#      | azureFolderAccess | azureBucketApi2 | azurePermanentDelete | Post   | 206             | dbAccess   | permanentDelete_sampleJson | Test to give folder access to user |
#
#  Scenario Outline: (Azure Bucket APIs) Remove access of the folder from the users when folder is not present in DB
#    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint           | endpoint1       | endpoint2            | Method | Expected_status | SampleName | SampleName1                | stepName                             |
#      | azureFolderAccess2 | azureBucketApi2 | azurePermanentDelete | Post   | 206             | dbAccess   | permanentDelete_sampleJson | Test to remove folder access to user |
#
#  Scenario Outline: (Azure Bucket APIs) Change tag to public
#    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint       | endpoint1       | endpoint2            | Method | Expected_status | SampleName           | SampleName1                | stepName                     |
#      | azureChangeTag | azureBucketApi2 | azurePermanentDelete | Post   | 200             | publicTag_sampleJson | permanentDelete_sampleJson | Test to change tag to public |
#
#  Scenario Outline: (Azure Bucket APIs) Change tag to private
#    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint       | endpoint1       | endpoint2            | Method | Expected_status | SampleName            | SampleName1                | stepName                     |
#      | azureChangeTag | azureBucketApi2 | azurePermanentDelete | Post   | 200             | privateTag_sampleJson | permanentDelete_sampleJson | Test to change tag to public |
#
#  Scenario Outline: (Azure Bucket APIs) Change tag to public when Bridge Token is not valid
#    Given Set Post API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint       | Method | Expected_status | SampleName           |
#      | azureChangeTag | Post   | 403             | publicTag_sampleJson |
#
#  Scenario Outline: (Azure Bucket APIs) Change tag to public when username is not found in Bearer token
#    Given Set Post API without BT endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint       | Method | Expected_status | SampleName           |
#      | azureChangeTag | Post   | 403             | publicTag_sampleJson |
#
#  Scenario Outline: (Azure Bucket APIs) Change tag to public when tag provided is incorrect
#    Given Post Suite-API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint       | Method | Expected_status | SampleName            |
#      | azureChangeTag | Post   | 206             | publicTag2_sampleJson |
#
#  Scenario Outline: (Azure Bucket APIs) Moving the files to the recycle bin
#    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint       | endpoint1       | endpoint2            | Method | Expected_status | SampleName           | SampleName1                | stepName                     |
#      | azureDeleteTag | azureBucketApi2 | azurePermanentDelete | Post   | 200             | deleteTag_sampleJson | permanentDelete_sampleJson | Test to change tag to public |
#
#  Scenario Outline: (Azure Bucket APIs) Moving the files to the recycle bin when Bridge Token is not valid
#    Given Set Post API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint       | Method | Expected_status | SampleName           |
#      | azureDeleteTag | Post   | 403             | deleteTag_sampleJson |
#
#  Scenario Outline: (Azure Bucket APIs) Moving the files to the recycle bin when username is not found in Bearer token
#    Given Set Post API without BT endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint       | Method | Expected_status | SampleName           |
#      | azureDeleteTag | Post   | 403             | deleteTag_sampleJson |
#
#  Scenario Outline: (Azure Bucket APIs) Moving the files to the recycle bin when tag provided is incorrect
#    Given Post Suite-API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint       | Method | Expected_status | SampleName            |
#      | azureDeleteTag | Post   | 206             | deleteTag2_sampleJson |
#
#  Scenario Outline: (Azure Bucket APIs) Moving the files to the recycle bin when file name is not in DB
#    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint       | endpoint1       | endpoint2            | Method | Expected_status | SampleName     | SampleName1                | stepName                     |
#      | azureDeleteTag | azureBucketApi2 | azurePermanentDelete | Post   | 206             | azureDeleteTag | permanentDelete_sampleJson | Test to change tag to public |
#
##      ####################### Bucket APIs-7 ###################################
##
##  Scenario Outline:Get the file from recycle bin (azure Api)
##    Given Post Suite-API endpoint and method and SampleName and step "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<SampleName>" and "<SampleName1>" and "<stepName>"
##    Then Verify Status code <Expected_status>
##    Examples:
##      | endpoint         | endpoint1       | endpoint2            | Method | Expected_status | SampleName            | SampleName1                | stepName                     |
##      | azureRecycleBinn | azureBucketApi2 | azurePermanentDelete | get    | 200             | deleteTag3_sampleJson | permanentDelete_sampleJson | Test to change tag to public |
#
##  Scenario Outline:Get the file from recycle bin (azure Api)
##    Given Sett token endpoint and method "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<endpoint3>" and "<Method>" and "<Method1>" and "<SampleName>" and "<SampleName2>"
##    Then Verify Status code <Expected_status>
##    Examples:
##      | endpoint         | endpoint1       | endpoint2      | endpoint3            | Method | Method1 | SampleName            | SampleName2                | Expected_status |
##      | azureRecycleBinn | azureBucketApi2 | azureDeleteTag | azurePermanentDelete | get    | post    | deleteTag3_sampleJson | permanentDelete_sampleJson | 200             |
###
#  Scenario Outline: (Azure Bucket APIs) Deleting the Files Permanently
#    Given Post Suite-API endpointt and methodd and SampleNamee and step "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>" and "<stepName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint             | endpoint1       | Method | Expected_status | SampleName                 | stepName                               |
#      | azurePermanentDelete | azureBucketApi2 | Post   | 200             | permanentDelete_sampleJson | Test to Deleting the Files Permanently |
#
#  Scenario Outline: (Azure Bucket APIs) Deleting the Files Permanently when Bridge Token is not valid
#    Given Set Post API endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint             | Method | Expected_status | SampleName                 |
#      | azurePermanentDelete | Post   | 403             | permanentDelete_sampleJson |
#
#  Scenario Outline: (Azure Bucket APIs) Deleting the Files Permanently when username is not found in Bearer token
#    Given Set Post API without BT endpoint and method and SampleName "<endpoint>" and "<Method>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint             | Method | Expected_status | SampleName                 |
#      | azurePermanentDelete | Post   | 403             | permanentDelete_sampleJson |
#
#  Scenario Outline: (Azure Bucket APIs) Deleting the Files Permanently when file is not in DB
#    Given Post Suite-API endpointt and methodd and SampleNamee and step "<endpoint>" and "<endpoint1>" and "<Method>" and "<SampleName>" and "<stepName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint             | endpoint1       | Method | Expected_status | SampleName        | stepName                               |
#      | azurePermanentDelete | azureBucketApi2 | Post   | 206             | azurePermanentDel | Test to Deleting the Files Permanently |
#
#  Scenario Outline: (Azure Bucket APIs) Get the Files when files are public
#    Given Get files by settingg Authentication: endpoint and method "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<Method>" and "<Method1>" and "<SampleName>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint     | endpoint1       | endpoint2            | Method | Method1 | SampleName                 | Expected_status |
#      | azureGetFile | azureBucketApi2 | azurePermanentDelete | get    | post    | permanentDelete_sampleJson | 200             |
#
#  Scenario Outline: (Azure Bucket APIs) Get the Files when it is private with Authentication
#    Given Get files by settingg Authentication: endpoints and methods "<endpoint>" and "<endpoint1>" and "<endpoint2>" and "<endpoint3>" and "<Method>" and "<Method1>" and "<SampleName>" and "<SampleName1>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint     | endpoint1       | endpoint2            | endpoint3      | Method | Method1 | SampleName                 | SampleName1           | Expected_status |
#      | azureGetFile | azureBucketApi2 | azurePermanentDelete | azureChangeTag | get    | post    | permanentDelete_sampleJson | privateTag_sampleJson | 200             |
#
#  Scenario Outline: (Azure Bucket APIs) Get the Files when username is not found in token and file is private.
#    Given Get file by setting endpoint and method "<endpoint>" and "<Method>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint     | Method | Expected_status |
#      | azureGetFile | get    | 404             |
#
#  Scenario Outline: (Azure Bucket APIs) Get the Files when file is in recycle bin.
#    Given Get file by setting Authentication, endpoint and method "<endpoint>" and "<Method>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint     | Method | Expected_status |
#      | azureGetFile | get    | 404             |
#
#  Scenario Outline: (Azure Bucket APIs) Get the Files when file not found
#    Given Get file by setting Authentication, endpoint and method "<endpoint>" and "<Method>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint     | Method | Expected_status |
#      | azureGetFile | get    | 404             |
#
#  Scenario Outline: (Azure Bucket APIs) Get the Files when file is private and user not have permission to see it.
#    Given Get file by setting Authentication, endpoint and method "<endpoint>" and "<Method>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint     | Method | Expected_status |
#      | azureGetFile | get    | 404             |
