package com.qa.gemini.StepDefinition;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gemini.generic.api.utils.ApiHealthCheckUtils;
import com.gemini.generic.api.utils.ProjectSampleJson;
import com.gemini.generic.bdd.GemJarCucumberBase;
import com.gemini.generic.reporting.GemEcoUpload;
import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import io.cucumber.messages.types.TestCase;
import io.restassured.RestAssured;
import com.gemini.generic.utils.ProjectConfigData;
import com.qa.gemini.CommonUtils.utils;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.restassured.response.Response;
import org.apache.http.util.EntityUtils;

import java.io.File;
import java.io.FileWriter;
import java.util.HashMap;
import java.util.Map;

import static com.qa.gemini.CommonUtils.utils.*;

public class stepDefinitions {
    int status;

    @Given("^Set endpoint and method \"(.*)\" and \"(.*)\"$")
    public void hitApiWithStep(String url, String method) throws Exception {
        status = utils.HitAPI(url, method, "Test for " + method.toUpperCase()).getStatus();
    }

    @Given("^Set endpoint and method in case of super admin \"(.*)\" and \"(.*)\"$")
    public void hitApiWithStep5(String url, String method) throws Exception {
        Map<String, String> headers2 = new HashMap<>();
        String j = token5();
        assert j != null;
        String jnew = j.replaceAll("^\"|\"$", "");
        headers2.put("Authorization", "Bearer " + jnew);
        GemTestReporter.addTestStep("Bearer Token", "Bearer Token :" + jnew, STATUS.INFO);
        status = utils.HitAPIWithToken(url, method, "Token Authentication", headers2).getStatus();
    }

    @Given("^Authenticate endpoint and method \"(.*)\" and \"(.*)\"$")
    public void hitApiWithoutStep(String url, String method) throws Exception {
        status = utils.HitAPI(url, method).getStatus();
    }

    @Then("Verify Status code {int}")
    public void check_status_code(int Expected) {
        utils.VerifyStatusCode(Expected, status);
    }

    @Given("^Set token endpoint and method \"(.*)\" and \"(.*)\"$")
    public void setNewwAs(String url, String method) throws Exception {
        Map<String, String> headers2 = new HashMap<>();
        String j = token();
        assert j != null;
        String jnew = j.replaceAll("^\"|\"$", "");
        headers2.put("Authorization", "Bearer " + jnew);
        GemTestReporter.addTestStep("Bearer Token", "Bearer Token :" + jnew, STATUS.INFO);
        status = utils.HitAPIWithToken(url, method, "Token Authentication", headers2).getStatus();
    }

    @Given("^Set token when user does not have access endpoint and method \"(.*)\" and \"(.*)\"$")
    public void get_api_admin_sc(String url, String method) throws Exception {
        Map<String, String> headers2 = new HashMap<>();
        String j = token2();
        assert j != null;
        String jnew = j.replaceAll("^\"|\"$", "");
        headers2.put("Authorization", "Bearer " + jnew);
        GemTestReporter.addTestStep("Bearer Token", "Bearer Token :" + jnew, STATUS.INFO);
        status = utils.HitAPIWithToken(url, method, "Token Authentication", headers2).getStatus();
    }

    @Given("^Set wrong bridge token endpoint and method \"(.*)\" and \"(.*)\"$")
    public void get_api_admin_sc2(String url, String method) throws Exception {
        Map<String, String> headers2 = new HashMap<>();
        String j = token2();
        assert j != null;
        String jnew = j.replaceAll("^\"|\"$", "");
        headers2.put("Authorization", "Bearer " + jnew + "maulick");
        GemTestReporter.addTestStep("Bearer Token", "Bearer Token :" + jnew, STATUS.INFO);
        status = utils.HitAPIWithToken(url, method, "", headers2).getStatus();
    }

    @Given("^Set user wrong token endpoint and method \"(.*)\" and \"(.*)\"$")
    public void setNewwAss(String url, String method) throws Exception {
        Map<String, String> headers2 = new HashMap<>();
        String j = token2();
        assert j != null;
        String jnew = j.replaceAll("^\"|\"$", "");
        headers2.put("Authorization", "Bearer " + jnew);
        GemTestReporter.addTestStep("Bearer Token", "Bearer Token :" + jnew, STATUS.INFO);
        status = utils.HitAPIWithToken(url, method, "", headers2).getStatus();
    }

    @Given("^Sett token endpoint and method \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void hitApiToken(String url, String url1, String url2, String url3, String method, String method1, String SampleName, String SampleName2) throws Exception {
        utils.TextUpload(url1, "Hello World", ProjectConfigData.getProperty("username"), utils.Gettoken2());
        Map<String, String> headers = new HashMap<>();
        String username = ProjectConfigData.getProperty("username");
        String bt = Gettoken2();
        headers.put("username", username);
        headers.put("bridgeToken", bt);
        utils.Access(url2, method1, SampleName, headers, "");
        Map<String, String> headers2 = new HashMap<>();
        String j = token();
        assert j != null;
        String jnew = j.replaceAll("^\"|\"$", "");
        headers2.put("Authorization", "Bearer " + jnew);
        GemTestReporter.addTestStep("Bearer Token", "Bearer Token :" + jnew, STATUS.INFO);
        status = utils.HitAPIWithToken(url, method, "Token Authentication", headers2).getStatus();
        utils.Access(url3, method1, SampleName2, headers, "");
    }

    @Given("^Setttz token endpoint and method \"(.*)\" and \"(.*)\"$")
    public void ruleApisss(String url, String method) throws Exception {
        Map<String, String> headers = new HashMap<>();
        String j = token();
        assert j != null;
        String jnew = j.replaceAll("^\"|\"$", "");
        headers.put("Authorization", "Bearer " + jnew);
        GemTestReporter.addTestStep("Bearer Token", "Bearer Token :" + jnew, STATUS.INFO);
        status = utils.HitAPIWithToken(url, method, "", headers).getStatus();
    }

    @Given("^Set emptyyy token endpoint and method \"(.*)\" and \"(.*)\"$")
    public void emptyyyy(String url, String method) throws Exception {
        Map<String, String> headers = new HashMap<>();
        String j = token();
        assert j != null;
        String jnew = j.replaceAll("^\"|\"$", "");
        headers.put("Authorization", "Bearer ");
        GemTestReporter.addTestStep("Bearer Token", "Bearer Token :" + null, STATUS.INFO);
        status = utils.HitAPIWithToken(url, method, "", headers).getStatus();
    }

    @Given("^Set Wrong token endpoint and method \"(.*)\" and \"(.*)\"$")
    public void hitApiTokenWrong(String url, String method) throws Exception {
        Map<String, String> headers = new HashMap<>();
        String j = token();
        String jnew = j.replaceAll("^\"|\"$", "");
        headers.put("Authorization", "Bearer " + jnew + "maulick");
        GemTestReporter.addTestStep("Bearer Token", "Bearer Token :" + jnew, STATUS.INFO);
        status = utils.HitAPIWithToken(url, method, headers).getStatus();
    }

    @Given("^Set Empty token endpoint and method \"(.*)\" and \"(.*)\"$")
    public void hitApiTokenEmpty(String url, String method) throws Exception {
        status = utils.HitAPIWithToken(url, method).getStatus();
        GemTestReporter.addTestStep("Bearer Token", "Bearer Token :" + null, STATUS.INFO);
    }

    @Given("^Set endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void Login(String url, String method, String SampleName) throws Exception {
        status = utils.LoginUser(url, method, SampleName, "Login user").getStatus();
    }

    @Given("^Set credentials endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void Loginwrong(String url, String method, String SampleName) throws Exception {
        status = utils.LoginUser(url, method, SampleName).getStatus();
    }

    @Given("^Set Suite-API endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void Suite_Api(String url, String method, String SampleName) throws Exception {
        status = utils.CheckAPiWithAuth(url, method, utils.Gettoken2(), SampleName).getStatus(); //returns bridge token
    }

    @Given("^Set Suite-API endpoint and method and SampleName for superAdmin \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void Suite_Api5(String url, String url2, String url3, String method, String SampleName, String SampleName2) throws Exception {
        status = utils.CheckAPiWithAuth5(url, method, utils.Gettoken2(), SampleName).getStatus(); //returns bridge token
        Map<String, String> headers = new HashMap<>();
        String j = token();
        assert j != null;
        String jnew = j.replaceAll("^\"|\"$", "");
        headers.put("Authorization", "Bearer " + jnew);
        GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
        status = utils.HitAPIPostToken7(url2, method, "Token", headers).getStatus();
        utils.HitAPIPostToken(url3, method, "Token", headers, SampleName2).getStatus();
    }

    @Given("^Set Suite-API endpoint and method and SampleName for superAdmin with no user \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void Suite_Api8(String url, String url2, String url3, String method, String SampleName, String SampleName2) throws Exception {
        status = utils.CheckAPiWithAuth5(url, method, utils.Gettoken2(), SampleName).getStatus(); //returns bridge token
        Map<String, String> headers = new HashMap<>();
        String j = token();
        assert j != null;
        String jnew = j.replaceAll("^\"|\"$", "");
        headers.put("Authorization", "Bearer " + jnew);
        GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
        status = utils.HitAPIPostToken8(url2, method, "Token", headers).getStatus();
        utils.HitAPIPostToken(url3, method, "Token", headers, SampleName2).getStatus();
    }

    @Given("^Set Suite-API endpoint and method and SampleName for superAdmin with invalid user \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void Suite_Api9(String url, String url2, String url3, String method, String SampleName, String SampleName2) throws Exception {
        status = utils.CheckAPiWithAuth5(url, method, utils.Gettoken2(), SampleName).getStatus(); //returns bridge token
        Map<String, String> headers = new HashMap<>();
        String j = token();
        assert j != null;
        String jnew = j.replaceAll("^\"|\"$", "");
        headers.put("Authorization", "Bearer " + jnew);
        GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
        status = utils.HitAPIPostToken9(url2, method, "Token", headers).getStatus();
        utils.HitAPIPostToken(url3, method, "Token", headers, SampleName2).getStatus();
    }

    @Given("^Set Suite-API using Wrong Authentication endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void Suite_Api2(String url, String method, String SampleName) throws Exception {
        status = utils.CheckAPiWithAuth(url, method, utils.Gettoken2() + "maulick", SampleName).getStatus();
    }

    @Given("^Set Suite-API when headers not given endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void Suite_Api3(String url, String method, String SampleName) throws Exception {
        status = utils.CheckAPiWithAuth(url, method, SampleName).getStatus();
    }

    @Given("^Update Suite using endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void UpdateSuite(String url, String method, String SampleName) throws Exception {
        status = utils.requestSuiteApi(url, method, utils.Gettoken2(), SampleName, "GEMPYP_TEST_PROD_63700467-4D93-46AB-A46E-727B2E85DC3F").getStatus();
    }

    @Given("^Update Suite when S-run-id not present using endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void UpdateSuite2(String url, String method, String SampleName) throws Exception {
        status = utils.requestSuiteApi(url, method, utils.Gettoken2(), SampleName, "b2f779e7-a4f2-44d8-a557-b3426ea520c14").getStatus();
    }

    @Given("^Update Suite using wrong Authentication using endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void UpdateSuite3(String url, String method, String SampleName) throws Exception {
        status = utils.requestSuiteApi(url, method, utils.Gettoken2() + "maulick", SampleName, "b2f779e7-a4f2-44d8-a557-b3426ea520c14").getStatus();
    }

    @Given("^Update Suite without Authentication using endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void UpdateSuite4(String url, String method, String SampleName) throws Exception {
        status = utils.requestSuiteApi(url, method, SampleName, "b2f779e7-a4f2-44d8-a557-b3426ea520c14").getStatus();
    }

    @Given("^Create record using endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void Create1(String url, String method, String SampleName) throws Exception {
        status = utils.requestSuiteApi(url, method, utils.Gettoken2(), SampleName, "GEMPYP_TEST_PROD_63700467-4D93-46AB-A46E-727B2E85DC3F").getStatus();
    }

    @Given("^Create record when s-id not exists using endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void Create2(String url, String method, String SampleName) throws Exception {
        status = utils.requestSuiteApi(url, method, utils.Gettoken2(), SampleName, "b2f779e7-a4f2-44d8-a557-b3426ea520c1").getStatus();
    }

    @Given("^Create record when s-id not given using endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void Create3(String url, String method, String SampleName) throws Exception {
        status = utils.requestSuiteApi(url, method, utils.Gettoken2(), SampleName, "b2f779e7-a4f2-44d8-a557-b3426ea520c1").getStatus();
    }

    @Given("^Create record when TC-id not given using endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void Create4(String url, String method, String SampleName) throws Exception {
        status = utils.requestSuiteApi(url, method, utils.Gettoken2(), SampleName, "GEMPYP_TEST_PROD_63700467-4D93-46AB-A46E-727B2E85DC3F").getStatus();
    }

    @Given("^Create record with wrong Authentication using endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void Create5(String url, String method, String SampleName) throws Exception {
        status = utils.requestSuiteApi(url, method, SampleName, "b2f779e7-a4f2-44d8-a557-b3426ea520c1").getStatus();
    }

    @Given("^Create record when authentication not given using endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void Create6(String url, String method, String SampleName) throws Exception {
        status = utils.requestSuiteApi(url, method, SampleName, "b2f779e7-a4f2-44d8-a557-b3426ea520c1").getStatus();
    }

    @Given("^Update Suite type2 using endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void UpdateSuite5(String url, String method, String SampleName) throws Exception {
        status = utils.UpdateSuiteApi(url, method, SampleName).getStatus();
    }

    @Given("^Update Suite without s-runid using endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void UpdateSuite6(String url, String method, String SampleName) throws Exception {
        status = utils.requestSuiteApi(url, method, SampleName).getStatus();
    }

    @Given("^Update Suite without tc-id using endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void UpdateSuite7(String url, String method, String SampleName) throws Exception {
        status = utils.requestSuiteApi(url, method, SampleName).getStatus();
    }

    @Given("^Set endpointt \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void fileUpload(String url, String url1, String method, String SampleName) throws Exception {
        FileWriter file = new FileWriter(System.getProperty("java.io.tmpdir") + "/jar.json");
        file.write("[\n" +
                "  {\n" +
                "    \"folderName\": \"maulick\",\n" +
                "    \"fileName\": \"Access_sampleJson.json\",\n" +
                "    \"usernames\": [\n" +
                "      \"pdeep\"\n" +
                "    ]\n" +
                "  }\n" +
                "]");
        file.close();
        status = utils.FileUpload(url, System.getProperty("java.io.tmpdir") + "/jar.json", ProjectConfigData.getProperty("username"), utils.Gettoken2());
        Map<String, String> headers = new HashMap<>();
        String username = ProjectConfigData.getProperty("username");
        String bt = Gettoken2();
        headers.put("username", username);
        headers.put("bridgeToken", bt);
        GemTestReporter.addTestStep("username", "username : " + username, STATUS.INFO);
        GemTestReporter.addTestStep("bridgeToken", "bridgeToken: " + bt, STATUS.INFO);
        utils.Access(url1, method, SampleName, headers, "");
    }

    @Given("^Set endpoint with incorrect bridgetoken \"(.*)\"$")
    public void fileUpload2(String url) throws Exception {
        FileWriter file = new FileWriter(System.getProperty("java.io.tmpdir") + "/jar.json");
        file.write("[\n" +
                "  {\n" +
                "    \"folderName\": \"maulick\",\n" +
                "    \"fileName\": \"Access_sampleJson.json\",\n" +
                "    \"usernames\": [\n" +
                "      \"pdeep\"\n" +
                "    ]\n" +
                "  }\n" +
                "]");
        file.close();
        status = utils.FileUpload(url, System.getProperty("java.io.tmpdir") + "/jar.json", ProjectConfigData.getProperty("username"), utils.Gettoken2() + "maulick");
    }

    @Given("^Set endpoint without username \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void fileUpload3(String url, String url1, String method, String SampleName) throws Exception {
        String j = token();
        assert j != null;
        String jnew = j.replaceAll("^\"|\"$", "");
        FileWriter file = new FileWriter(System.getProperty("java.io.tmpdir") + "/jar.json");
        file.write("[\n" +
                "  {\n" +
                "    \"folderName\": \"maulick\",\n" +
                "    \"fileName\": \"Access_sampleJson.json\",\n" +
                "    \"usernames\": [\n" +
                "      \"pdeep\"\n" +
                "    ]\n" +
                "  }\n" +
                "]");
        file.close();
        status = utils.FileUpload2(url, System.getProperty("java.io.tmpdir") + "/jar.json", jnew);
        Map<String, String> headers = new HashMap<>();
        String username = ProjectConfigData.getProperty("username");
        String bt = Gettoken2();
        headers.put("username", username);
        headers.put("bridgeToken", bt);
        GemTestReporter.addTestStep("username", "username : " + username, STATUS.INFO);
        GemTestReporter.addTestStep("bridgeToken", "bridgeToken: " + bt, STATUS.INFO);
        utils.Access(url1, method, SampleName, headers, "");
    }

    @Given("^Set endpoint without usernames \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void azureUpload(String url, String url1, String method, String SampleName) throws Exception {
        String j = token();
        assert j != null;
        String jnew = j.replaceAll("^\"|\"$", "");
        FileWriter file = new FileWriter(System.getProperty("java.io.tmpdir") + "/jar.json");
        file.write("[\n" +
                "  {\n" +
                "    \"folderName\": \"maulick\",\n" +
                "    \"fileName\": \"Access_sampleJson.json\",\n" +
                "    \"usernames\": [\n" +
                "      \"pdeep\"\n" +
                "    ]\n" +
                "  }\n" +
                "]");
        file.close();
        status = utils.AzurefileUpload(url, System.getProperty("java.io.tmpdir") + "/jar.json", jnew);
        Map<String, String> headers = new HashMap<>();
        String username = ProjectConfigData.getProperty("username");
        String bt = Gettoken2();
        headers.put("username", username);
        headers.put("bridgeToken", bt);
        GemTestReporter.addTestStep("username", "username : " + username, STATUS.INFO);
        GemTestReporter.addTestStep("bridgeToken", "bridgeToken: " + bt, STATUS.INFO);
        utils.Access(url1, method, SampleName, headers, "");
    }

    @Given("^Set endpoint without username in Bearer Token \"(.*)\"$")
    public void fileUpload5(String url) throws Exception {
        String jnew = "";
        FileWriter file = new FileWriter(System.getProperty("java.io.tmpdir") + "/jar.json");
        file.write("[\n" +
                "  {\n" +
                "    \"folderName\": \"maulick\",\n" +
                "    \"fileName\": \"Access_sampleJson.json\",\n" +
                "    \"usernames\": [\n" +
                "      \"pdeep\"\n" +
                "    ]\n" +
                "  }\n" +
                "]");
        file.close();
        status = utils.FileUpload2(url, System.getProperty("java.io.tmpdir") + "/jar.json", jnew);
    }

    @Given("^Set endpoint with username not present in db \"(.*)\"$")
    public void fileUpload4(String url) throws Exception {
        FileWriter file = new FileWriter(System.getProperty("java.io.tmpdir") + "/jar.json");
        file.write("[\n" +
                "  {\n" +
                "    \"folderName\": \"maulick\",\n" +
                "    \"fileName\": \"Access_sampleJson.json\",\n" +
                "    \"usernames\": [\n" +
                "      \"pdeep\"\n" +
                "    ]\n" +
                "  }\n" +
                "]");
        file.close();
        status = utils.FileUpload(url, System.getProperty("java.io.tmpdir") + "/jar.json", "", utils.Gettoken2());
    }

    @Given("^Set endpoint with text \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void fileUpload6(String url, String url1, String method, String SampleName) throws Exception {
        status = utils.TextUpload(url, "Hello World", ProjectConfigData.getProperty("username"), utils.Gettoken2()).getStatus();
        Map<String, String> headers = new HashMap<>();
        String username = ProjectConfigData.getProperty("username");
        String bt = Gettoken2();
        headers.put("username", username);
        headers.put("bridgeToken", bt);
        GemTestReporter.addTestStep("username", "username : " + username, STATUS.INFO);
        GemTestReporter.addTestStep("bridgeToken", "bridgeToken: " + bt, STATUS.INFO);
        utils.Access(url1, method, SampleName, headers, "");
    }

    @Given("^Set posting user wrong token endpoint and method \"(.*)\" and \"(.*)\"$")
    public void azure(String url, String method) throws Exception {
        String j = token2();
        assert j != null;
        String jnew = j.replaceAll("^\"|\"$", "");
        status = utils.TextUpload3(url, "Hello World", jnew).getStatus();
    }

    @Given("^Set endpoint with text wrong tag \"(.*)\"$")
    public void fileUpload7(String url) throws Exception {
        status = utils.TextUpload2(url, "Hello World", ProjectConfigData.getProperty("username"), utils.Gettoken2()).getStatus();
    }

    @Given("^Set endpoint with text with wrong BridgeToken \"(.*)\"$")
    public void fileUpload8(String url) throws Exception {
        status = utils.TextUpload2(url, "Hello World", ProjectConfigData.getProperty("username"), utils.Gettoken2() + "hello").getStatus();
    }

    @Given("^Set endpoint with text when BT is not present \"(.*)\"$")
    public void fileUpload9(String url) throws Exception {
        status = utils.TextUpload3(url, "Hello World", "").getStatus();
    }

    @Given("^Set endpoint with text without valid username \"(.*)\"$")
    public void fileUploads(String url) throws Exception {
        status = utils.TextUpload2(url, "Hello World", "abcdefghijk", utils.Gettoken2()).getStatus();
    }

    @Given("^Set endpoint with text without write access \"(.*)\"$")
    public void fileUploads2(String url) throws Exception {
        status = utils.TextUpload2(url, "Hello World", ProjectConfigData.getProperty("username"), utils.Gettoken2()).getStatus();
    }

    @Given("^Post Suite-API endpoint and method and SampleName and step \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void Suite_Api1(String url, String url1, String url2, String method, String SampleName, String SampleName1, String stepname) throws Exception {
        utils.TextUpload(url1, "Hello World", ProjectConfigData.getProperty("username"), utils.Gettoken2());
        Map<String, String> headers = new HashMap<>();
        String username = ProjectConfigData.getProperty("username");
        String bt = Gettoken2();
        headers.put("username", username);
        headers.put("bridgeToken", bt);
        GemTestReporter.addTestStep("username", "username : " + username, STATUS.INFO);
        GemTestReporter.addTestStep("bridgeToken", "bridgeToken: " + bt, STATUS.INFO);
        status = utils.Access(url, method, SampleName, headers, stepname).getStatus();
        utils.Access(url2, method, SampleName1, headers, "");
    }

    @Given("^Post Suite-API endpointt and methodd and SampleNamee and step \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void deleNew(String url, String url1, String method, String SampleName, String stepname) throws Exception {
        utils.TextUpload(url1, "Hello World", ProjectConfigData.getProperty("username"), utils.Gettoken2());
        Map<String, String> headers = new HashMap<>();
        String username = ProjectConfigData.getProperty("username");
        String bt = Gettoken2();
        headers.put("username", username);
        headers.put("bridgeToken", bt);
        GemTestReporter.addTestStep("username", "username : " + username, STATUS.INFO);
        GemTestReporter.addTestStep("bridgeToken", "bridgeToken: " + bt, STATUS.INFO);
        status = utils.Access(url, method, SampleName, headers, stepname).getStatus();
    }

    @Given("^Post Suite-API endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void Suite_Api12(String url, String method, String SampleName) throws Exception {
        Map<String, String> headers = new HashMap<>();
        String bt = Gettoken2();
        String username = ProjectConfigData.getProperty("username");
        headers.put("username", username);
        headers.put("bridgeToken", bt);
        GemTestReporter.addTestStep("username", "username : " + username, STATUS.INFO);
        GemTestReporter.addTestStep("bridgeToken", "bridgeToken: " + bt, STATUS.INFO);
        status = utils.Access(url, method, SampleName, headers).getStatus();
    }

    @Given("^Set Post API endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void Suite_Api13(String url, String method, String SampleName) throws Exception {
        Map<String, String> headers = new HashMap<>();
        String bt = Gettoken2();
        String username = ProjectConfigData.getProperty("username");
        headers.put("username", username);
        headers.put("bridgeToken", bt + "maulick");
        GemTestReporter.addTestStep("username", "username : " + username, STATUS.INFO);
        GemTestReporter.addTestStep("bridgeToken", "bridgeToken: " + bt, STATUS.INFO);
        status = utils.Access(url, method, SampleName, headers).getStatus();
    }

    @Given("^sett tokenn endpointt and method \"(.*)\" and \"(.*)\"$")
    public void lastFive(String url, String method) throws Exception {
        Map<String, String> headers = new HashMap<>();
        String bt = Gettoken2();
        String username = ProjectConfigData.getProperty("username");
        headers.put("username", username);
        headers.put("bridgeToken", bt);
        GemTestReporter.addTestStep("username", "username : " + username, STATUS.INFO);
        GemTestReporter.addTestStep("bridgeToken", "bridgeToken: " + bt, STATUS.INFO);
        status = utils.lastFiveM(url, method, "Token Authentication", headers).getStatus();
    }

    @Given("^sett tokenn endpointt and methodd \"(.*)\" and \"(.*)\"$")
    public void lastFiveOne(String url, String method) throws Exception {
        Map<String, String> headers = new HashMap<>();
        String bt = Gettoken2();
        String username = ProjectConfigData.getProperty("username");
        headers.put("username", username);
        headers.put("bridgeToken", bt);
        GemTestReporter.addTestStep("username", "username : " + username, STATUS.INFO);
        GemTestReporter.addTestStep("bridgeToken", "bridgeToken: " + bt, STATUS.INFO);
        status = utils.lastFiveM(url, method, "", headers).getStatus();
    }

    @Given("^sett tokenn endpointt and methoddd \"(.*)\" and \"(.*)\"$")
    public void lastFiveTwo(String url, String method) throws Exception {
        Map<String, String> headers = new HashMap<>();
        String username = ProjectConfigData.getProperty("username");
        headers.put("username", username);
        headers.put("bridgeToken", "");
        GemTestReporter.addTestStep("username", "username : " + username, STATUS.INFO);
        GemTestReporter.addTestStep("bridgeToken", "bridgeToken: " + null, STATUS.INFO);
        status = utils.lastFiveM(url, method, "", headers).getStatus();
    }

    @Given("^Set Post API without BT endpoint and method and SampleName \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void Suite_Api14(String url, String method, String SampleName) throws Exception {
        Map<String, String> headers = new HashMap<>();
        headers.put("Authorization", "Bearer " + "");
        GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + null, STATUS.INFO);
        status = utils.Access(url, method, SampleName, headers).getStatus();
    }

    @Given("^Set endpoint and method without bearer token \"(.*)\" and \"(.*)\"$")
    public void Suite_Api14(String url, String method) throws Exception {
        Map<String, String> headers = new HashMap<>();
        headers.put("Authorization", "Bearer " + "");
        GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + null, STATUS.INFO);
        status = utils.Access(url, method, headers).getStatus();
    }

    @Given("^Setting token endpoint and method \"(.*)\" and \"(.*)\"$")
    public void hitApiTokenWrong1(String url, String method) throws Exception {
        Map<String, String> headers = new HashMap<>();
        String j = token4();
        assert j != null;
        String jnew = j.replaceAll("^\"|\"$", "");
        headers.put("Authorization", "Bearer " + jnew);
        GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
        status = utils.HitAPIWithToken(url, method, headers).getStatus();
    }

    @Given("^Get file by setting Authentication, endpoint and method \"(.*)\" and \"(.*)\"$")
    public void getFile(String url, String method) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            Map<String, String> parameters = new HashMap<>();
            parameters.put("id", "gem-np:MAULICK:jar.json");
            RestAssured.baseURI = ProjectConfigData.getProperty(url);
            GemTestReporter.addTestStep("Request URL", ProjectConfigData.getProperty(url), STATUS.INFO);
            //  status = RestAssured.given().params(parameters).headers(headers).when().get().getStatusCode();
            Response response = RestAssured.given().params(parameters).headers(headers).when().get();
            status = response.statusCode();
            String s = response.body().print();
            JsonObject js = (JsonObject) JsonParser.parseString(s);
            GemTestReporter.addTestStep("Response Body", s, STATUS.INFO);
            GemTestReporter.addTestStep("Message", js.get("message").getAsString(), STATUS.INFO);
            GemTestReporter.addTestStep("Operation", js.get("operation").getAsString(), STATUS.INFO);
            GemTestReporter.addTestStep("Request Verification", "Request executed successfully", STATUS.PASS);
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Get file by setting endpoint and method \"(.*)\" and \"(.*)\"$")
    public void getFile2(String url, String method) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            headers.put("Authorization", "Bearer " + "");
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + null, STATUS.INFO);
            Map<String, String> parameters = new HashMap<>();
            parameters.put("id", "gem-np:MAULICK:jar.json");
            RestAssured.baseURI = ProjectConfigData.getProperty(url);
            GemTestReporter.addTestStep("Request URL", ProjectConfigData.getProperty(url), STATUS.INFO);
            status = RestAssured.given().params(parameters).when().get().statusCode();
            GemTestReporter.addTestStep("Request Verification", "Request executed successfully", STATUS.PASS);
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Get files by settingg Authentication: endpoint and method \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void getFilesfromAzure(String url, String url1, String url2, String method, String method1, String SampleName) throws Exception {
        try {
            utils.TextUpload(url1, "Hello World", ProjectConfigData.getProperty("username"), utils.Gettoken2());
            Map<String, String> headers = new HashMap<>();
            String j = token();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            Map<String, String> parameters = new HashMap<>();
            parameters.put("id", "container:MAULICK:Access_sampleJson.json");
            RestAssured.baseURI = ProjectConfigData.getProperty(url);
            GemTestReporter.addTestStep("Request URL", ProjectConfigData.getProperty(url), STATUS.INFO);
            Response R = RestAssured.given().params(parameters).headers(headers).when().get();
            status = R.getStatusCode();
            if (status == 200) {
                //GemTestReporter.addTestStep("Response message",R.getStatusLine().toUpperCase(),STATUS.INFO);
                GemTestReporter.addTestStep("Request Verification", "Request executed successfully", STATUS.PASS);
            } else {
                GemTestReporter.addTestStep("Request Verification", "Request executed unsuccessfully", STATUS.FAIL);
            }
            utils.Access(url2, method1, SampleName, headers, "");
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Get file by setting Authentication: endpoint and method \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void getFile3(String url, String url1, String url2, String method, String method1, String SampleName) throws Exception {
        try {
            utils.TextUpload(url1, "Hello World", ProjectConfigData.getProperty("username"), utils.Gettoken2());
            Map<String, String> headers = new HashMap<>();
            String j = token();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            Map<String, String> parameters = new HashMap<>();
            parameters.put("id", "gem-np:MAULICK:Access_sampleJson.json");
            RestAssured.baseURI = ProjectConfigData.getProperty(url);
            GemTestReporter.addTestStep("Request URL", ProjectConfigData.getProperty(url), STATUS.INFO);
            Response R = RestAssured.given().params(parameters).headers(headers).when().get();
            status = R.getStatusCode();
            if (status == 200) {
                //GemTestReporter.addTestStep("Response message",R.getStatusLine().toUpperCase(),STATUS.INFO);
                GemTestReporter.addTestStep("Request Verification", "Request executed successfully", STATUS.PASS);
            } else {
                GemTestReporter.addTestStep("Request Verification", "Request executed unsuccessfully", STATUS.FAIL);
            }
            utils.Access(url2, method1, SampleName, headers, "");
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Get files by settingg Authentication: endpoints and methods \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void getFileWhenPrivateAz(String url, String url1, String url2, String url3, String method, String method1, String SampleName, String SampleName1) throws Exception {
        try {
            utils.TextUpload(url1, "Hello World", ProjectConfigData.getProperty("username"), utils.Gettoken2());
            Map<String, String> headers = new HashMap<>();
            String username = ProjectConfigData.getProperty("username");
            String bt = Gettoken2();
            headers.put("username", username);
            headers.put("bridgeToken", bt);
            utils.Access(url3, method1, SampleName1, headers, "");
            Map<String, String> headers2 = new HashMap<>();
            String j = token();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers2.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            Map<String, String> parameters = new HashMap<>();
            parameters.put("id", "container:MAULICK:Access_sampleJson.json");
            RestAssured.baseURI = ProjectConfigData.getProperty(url);
            GemTestReporter.addTestStep("Request URL", ProjectConfigData.getProperty(url), STATUS.INFO);
            status = RestAssured.given().params(parameters).headers(headers2).when().get().statusCode();
            GemTestReporter.addTestStep("Request Verification", "Request executed successfully", STATUS.PASS);
            utils.Access(url2, method1, SampleName, headers, "");

        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("Gett file by settingg Authentication: endpoint and method \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void getFilePvtt(String url, String url1, String url2, String url3, String method, String method1, String SampleName, String SampleName1) throws Exception {
        try {
            utils.TextUpload(url1, "Hello World", ProjectConfigData.getProperty("username"), utils.Gettoken2());
            Map<String, String> headers = new HashMap<>();
            String username = ProjectConfigData.getProperty("username");
            String bt = Gettoken2();
            headers.put("username", username);
            headers.put("bridgeToken", bt);
            utils.Access(url3, method1, SampleName1, headers, "");
            Map<String, String> headers2 = new HashMap<>();
            String j = token();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers2.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            Map<String, String> parameters = new HashMap<>();
            parameters.put("id", "gem-np:MAULICK:Access_sampleJson.json");
            RestAssured.baseURI = ProjectConfigData.getProperty(url);
            GemTestReporter.addTestStep("Request URL", ProjectConfigData.getProperty(url), STATUS.INFO);
            status = RestAssured.given().params(parameters).headers(headers2).when().get().statusCode();
            GemTestReporter.addTestStep("Request Verification", "Request executed successfully", STATUS.PASS);
            utils.Access(url2, method1, SampleName, headers, "");

        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Set post token endpoint and method \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void postM(String url, String method, String SampleName) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            status = utils.HitAPIPostToken(url, method, "Token Authentication", headers, SampleName).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Set post token endpoint and method for dynamic \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void postDynamics(String url, String url2, String method, String method2, String SampleName) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            status = utils.HitAPIPostToken(url, method, "Token Authentication", headers, SampleName).getStatus();
            utils.HitAPIWithTokenDynamic(url2, method2, "Token Authentication", headers).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Set post token endpoint and method for new project \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void postMProject(String url, String method, String SampleName) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            status = utils.HitAPIPostToken(url, method, "Token Authentication", headers, SampleName).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Set post token endpoint and method in case of super admin \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void superAdminAdd(String url, String method, String SampleName) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token5();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            String payloads = ProjectSampleJson.getSampleDataString(SampleName);
            JsonParser parser = new JsonParser();
            JsonObject pay = (JsonObject) parser.parse(payloads);
            String name = String.valueOf(pay.get("name"));
            System.out.println("NAME: " + name);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            status = utils.HitAPIPostToken(url, method, "Token Authentication", headers, SampleName).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Set post token endpoint and method in case of super admin delete \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void superAdminAdd(String url, String url2, String method, String method2, String SampleName, String SampleName2) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token5();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
//            String payloads = ProjectSampleJson.getSampleDataString(SampleName);
//            JsonParser parser = new JsonParser();
//            JsonObject pay = (JsonObject) parser.parse(payloads);
//            String name = String.valueOf(pay.get("realCompany"));
//            System.out.println("NAME: " + name);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            status = utils.HitAPIPostToken(url, method, "Token Authentication", headers, SampleName).getStatus();
            utils.HitAPIPostToken(url2, method2, "Token Authentication", headers, SampleName2);
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Set post token endpoint and method in case of super admin when bt is wrong \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void superAdminAdd2(String url, String method, String SampleName) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token5();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew + "Mauic");
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            status = utils.HitAPIPostToken(url, method, "", headers, SampleName).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Set endpoint and method for blocking a user \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void blockingUser(String url, String url2, String method, String SampleName) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            status = utils.HitAPIPostToken(url, method, "Token Authentication", headers, SampleName).getStatus();
            utils.HitAPIPostToken(url2, method, "Token Authentication", headers, SampleName).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Set endpoint and method for blocking a user and get \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void blockingUserGet(String url, String url2, String url3, String method, String method1, String SampleName) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            utils.HitAPIPostToken(url, method, "Token Authentication", headers, SampleName).getStatus();
            status = utils.HitAPIWithToken(url3, method1, "Token Authentication", headers).getStatus();
            utils.HitAPIPostToken(url2, method, "Token Authentication", headers, SampleName).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Set endpoint and method for blocking a user with wrong bt \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void blockingUser2(String url, String url2, String method, String SampleName) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew + "maulic");
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            status = utils.HitAPIPostToken(url, method, "", headers, SampleName).getStatus();
            utils.HitAPIPostToken(url2, method, "", headers, SampleName).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Set post token without steps endpoint and method \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void without_step_token(String url, String method, String SampleName) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            status = utils.HitAPIPostToken(url, method, "", headers, SampleName).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Setttt post array token endpoint and method \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void array_jsonn(String url, String method, String SampleName) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            status = utils.hitApiWithArray(url, method, "Token Authentication", headers, SampleName).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Test accept API for admin screen \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void array_admin_json12(String url, String url1, String url2, String method, String SampleName, String SampleName1, String SampleName2) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token4();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            utils.hitApiWithArray(url, method, "Token Authentication", headers, SampleName).getStatus();
            Map<String, String> headers1 = new HashMap<>();
            String j1 = token();
            assert j1 != null;
            String jnew1 = j1.replaceAll("^\"|\"$", "");
            headers1.put("Authorization", "Bearer " + jnew1);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew1, STATUS.INFO);
            status = utils.hitApiWithArray(url1, method, "Token Authentication", headers1, SampleName1).getStatus();
            utils.HitAPIPostToken(url2, method, "Token Authentication", headers1, SampleName2).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Test accept with no bt API for admin screen \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void array_admin_json123(String url, String url1, String method, String SampleName, String SampleName1) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token4();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            utils.hitApiWithArray(url, method, "Token Authentication", headers, SampleName).getStatus();
            Map<String, String> headers1 = new HashMap<>();
            String j1 = token();
            assert j1 != null;
            String jnew1 = j.replaceAll("^\"|\"$", "");
            headers1.put("Authorization", "Bearer ");
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew1, STATUS.INFO);
            status = utils.hitApiWithArray(url1, method, "", headers1, SampleName1).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Test decline API for admin screen \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void array_admin_json1234(String url, String url1, String method, String SampleName, String SampleName1) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token4();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            utils.hitApiWithArray(url, method, "Token Authentication", headers, SampleName).getStatus();
            Map<String, String> headers1 = new HashMap<>();
            String j1 = token();
            assert j1 != null;
            String jnew1 = j1.replaceAll("^\"|\"$", "");
            headers1.put("Authorization", "Bearer " + jnew1);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew1, STATUS.INFO);
            status = utils.HitAPIPostToken(url1, method, "Token Authentication", headers1, SampleName1).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Test decline with no bt API for admin screen \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void array_admin_json12345(String url, String url1, String method, String SampleName, String SampleName1) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token4();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            utils.hitApiWithArray(url, method, "Token Authentication", headers, SampleName).getStatus();
            Map<String, String> headers1 = new HashMap<>();
            String j1 = token();
            assert j1 != null;
            String jnew1 = j1.replaceAll("^\"|\"$", "");
            headers1.put("Authorization", "Bearer ");
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew1, STATUS.INFO);
            status = utils.HitAPIPostToken(url1, method, "", headers1, SampleName1).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Set bearer token as empty in case of array \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void array_jsonn4(String url, String method, String SampleName) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer ");
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            status = utils.hitApiWithArray(url, method, "", headers, SampleName).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Setttt post array wrong token endpoint and method \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void array_jsonn_admin(String url, String method, String SampleName) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token2();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            status = utils.hitApiWithArray(url, method, "Token Authentication", headers, SampleName).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Setttt post array wrong bearer endpoint and method \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void array_jsonn_admin4(String url, String method, String SampleName) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token2();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer ");
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            status = utils.hitApiWithArray(url, method, "Token Authentication", headers, SampleName).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }


    @Given("^Set post user wrong token endpoint and method \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void postMmm(String url, String method, String SampleName) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token2();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            status = utils.HitAPIPostToken(url, method, "", headers, SampleName).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Set posterr user wrong token endpoint and method \"(.*)\" and \"(.*)\"$")
    public void url_has_chck(String url, String method) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token2();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            status = utils.HitAPIPostToken(url, method, "", headers, "").getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Set posterr userrss wrong token endpoint and method \"(.*)\" and \"(.*)\"$")
    public void user_accs_chckk(String url, String method) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token3();
            System.out.println(j);
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            status = utils.HitAPIPostToken(url, method, "", headers, "").getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Set post array user wrong token endpoint and method \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void array_wrong_user(String url, String method, String SampleName) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token2();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            status = utils.HitApiArrayUserr(url, method, "", headers, SampleName).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Set post empty token endpoint and method \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void wrongTokenn(String url, String method, String SampleName) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer ");
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + null, STATUS.INFO);
            status = utils.HitAPIPostToken(url, method, "", headers, SampleName).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Sett posttt token endpoint and method \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void postRULEAPi(String url, String method, String SampleName) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            status = utils.HitAPIPostToken(url, method, "", headers, SampleName).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }


    @Given("^Set posttt token endpoint and method \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void postMe(String url, String method, String SampleName) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String j = token();
            assert j != null;
            String jnew = j.replaceAll("^\"|\"$", "");
            headers.put("Authorization", "Bearer " + jnew);
            GemTestReporter.addTestStep("Bearer Token", "Bearer Token: " + jnew, STATUS.INFO);
            status = utils.HitAPIPostToken(url, method, "", headers, SampleName).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Set bridges token for files \"(.*)\" and \"(.*)\" and \"(.*)\"$")
    public void ruleApi(String url, String method, String stepName) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String bt = Gettoken2();
            String username = ProjectConfigData.getProperty("username");
            headers.put("username", username);
            headers.put("bridgeToken", bt);
            GemTestReporter.addTestStep("username", "username : " + username, STATUS.INFO);
            GemTestReporter.addTestStep("bridgeToken", "bridgeToken: " + bt, STATUS.INFO);
            status = utils.ruleAPii(url, method, stepName, headers).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Set bridge token for files \"(.*)\" and \"(.*)\"$")
    public void rApi1(String url, String method) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
//            String bt = Gettoken2();
            String username = ProjectConfigData.getProperty("username");
            headers.put("username", username);
            headers.put("bridgeToken", "");
            GemTestReporter.addTestStep("username", "username : " + username, STATUS.INFO);
            GemTestReporter.addTestStep("bridgeToken", "bridgeToken: " + null, STATUS.INFO);
            status = utils.ruleAPii(url, method, "", headers).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }

    @Given("^Set bridges tokennn for files \"(.*)\" and \"(.*)\"$")
    public void downAPII(String url, String method) throws Exception {
        try {
            Map<String, String> headers = new HashMap<>();
            String bt = Gettoken2();
            String username = ProjectConfigData.getProperty("username");
            headers.put("username", username);
            headers.put("bridgeToken", bt);
            GemTestReporter.addTestStep("username", "username : " + username, STATUS.INFO);
            GemTestReporter.addTestStep("bridgeToken", "bridgeToken: " + bt, STATUS.INFO);
            status = utils.DownldAPII(url, method, headers).getStatus();
        } catch (Exception e) {
            GemTestReporter.addTestStep("Request Verification", "Request not executed", STATUS.FAIL);
        }
    }


}
