/**
 * @description       : test class for Utils class
 * @author            : Siberian89
 * @group             :
 * @created on        : 2022-08-19 
 * @last modified on  : 2023-06-02
 * @last modified by  : Siberian89
**/
@isTest
private class UtilsTest {

    /***** START getCronExpressionStringFromDateTime(DateTime dtToFormat) TESTS *****/
    /**
    * @description test method for Utils.getCronExpressionStringFromDateTime(DateTime dtToFormat) in case of correct parameters
    * @author Siberian89 | 2022-09-02 
    **/
    @isTest
    private static void getCronExpressionStringFromDateTimeTestCorrectParam(){
        DateTime dtToTest = Datetime.newInstance(2008, 12, 1, 10, 30, 2);

        Test.startTest();
        String testResultCronExp = Utils.getCronExpressionStringFromDateTime(dtToTest);
        Test.stopTest();

        Assert.areEqual('2 30 10 1 12 ? 2008', testResultCronExp, 'different cron expression formatted by getCronExpressionStringFromDateTime(DateTime dtToFormat)');
    }

    /**
    * @description test method for Utils.getCronExpressionStringFromDateTime(DateTime dtToFormat) in case of invalid parameters
    * @author Siberian89 | 2022-09-02 
    **/
    @isTest
    private static void getCronExpressionStringFromDateTimeTestException(){
        DateTime dtToTest;

        Test.startTest();
        String testResultCronExp = Utils.getCronExpressionStringFromDateTime(dtToTest);
        Test.stopTest();

        Assert.isNull(testResultCronExp, 'unexpected behavior with invalid parameters in getCronExpressionStringFromDateTime(DateTime dtToFormat)');
    }
    /***** STOP getCronExpressionStringFromDateTime(DateTime dtToFormat) TESTS *****/


    /***** START getObjectRecordTypeIdFromDeveloperName(String objApiName, String rtDevName) TESTS *****/
    /**
    * @description test method for Utils.getObjectRecordTypeIdFromDeveloperName(String objApiName, String rtDevName) in case of invalid parameters
    * @author Siberian89 | 2022-08-19 
    **/
    @isTest
    private static void getObjectRecordTypeIdFromDeveloperNameTestException(){
        Test.startTest();
        Id testResultId = Utils.getObjectRecordTypeIdFromDeveloperName('NotAnObject','');
        Test.stopTest();

        Assert.isNull(testResultId, 'unexpected behavior with invalid parameters in getObjectRecordTypeIdFromDeveloperName(String objApiName, String rtDevName)');
    }
    /***** STOP getObjectRecordTypeIdFromDeveloperName(String objApiName, String rtDevName) TESTS *****/


    /***** START getObjectRecordTypeIdFromName(String objApiName, String rtName) TESTS *****/
    /**
    * @description test method for Utils.getObjectRecordTypeIdFromDeveloperName(String objApiName, String rtDevName) in case of invalid parameters
    * @author Siberian89 | 2022-08-19 
    **/
    @isTest
    private static void getObjectRecordTypeIdFromNameTestException(){
        Test.startTest();
        Id testResultId = Utils.getObjectRecordTypeIdFromName('NotAnObject','');
        Test.stopTest();

        Assert.isNull(testResultId, 'unexpected behavior with invalid parameters in getObjectRecordTypeIdFromName(String objApiName, String rtName)');
    }
    /***** STOP getObjectRecordTypeIdFromName(String objApiName, String rtName) TESTS *****/


    /***** START getObjectRecordTypeDeveloperNameFromRecordTypeId(String objApiName, String rtDevName) TESTS *****/
    /**
    * @description test method for Utils.getObjectRecordTypeDeveloperNameFromRecordTypeId(String objApiName, String rtDevName) in case of invalid parameters
    * @author Siberian89 | 2022-09-01 
    **/
    @isTest
    private static void getObjectRecordTypeDeveloperNameFromRecordTypeIdTestException(){
        Test.startTest();
        String testResultDeveloperName = Utils.getObjectRecordTypeDeveloperNameFromRecordTypeId('NotAnObject','');
        Test.stopTest();

        Assert.isTrue(String.isBlank(testResultDeveloperName), 'unexpected behavior with invalid parameters in getObjectRecordTypeDeveloperNameFromRecordTypeId(String objApiName, Id rtId)');
    }
    /***** STOP getObjectRecordTypeDeveloperNameFromRecordTypeId(String objApiName, String rtDevName) TESTS *****/


    /***** START getObjectRecordTypeNameFromRecordTypeId(String objApiName, String rtDevName) TESTS *****/
    /**
    * @description test method for Utils.getObjectRecordTypeNameFromRecordTypeId(String objApiName, String rtDevName) in case of invalid parameters
    * @author Siberian89 | 2022-09-01 
    **/
    @isTest
    private static void getObjectRecordTypeNameFromRecordTypeIdTestException(){
        Test.startTest();
        String testResultName = Utils.getObjectRecordTypeNameFromRecordTypeId('NotAnObject','');
        Test.stopTest();

        Assert.isTrue(String.isBlank(testResultName), 'unexpected behavior with invalid parameters in getObjectRecordTypeNameFromRecordTypeId(String objApiName, Id rtId)');
    }
    /***** STOP getObjectRecordTypeNameFromRecordTypeId(String objApiName, String rtDevName) TESTS *****/


    /***** START getSelectAllFieldQueryString(String objApiName) TESTS *****/
    /**
    * @description test method for Utils.getSelectAllFieldQueryString(String objApiName) in case of correct parameter
    * @author Siberian89 | 2022-08-19 
    **/
    @isTest
    private static void getSelectAllFieldQueryStringTestCorrectParam(){
        Test.startTest();
        String testQuery = Utils.getSelectAllFieldQueryString('Account');
        Test.stopTest();

        Assert.isTrue(String.isNotBlank(testQuery), 'empty query returned by getSelectAllFieldQueryString(String objApiName)');
        Assert.isTrue(testQuery.startsWith('SELECT '), 'incorrect query returned by getSelectAllFieldQueryString(String objApiName)');
    }

    /**
    * @description test method for Utils.getSelectAllFieldQueryString(String objApiName) in case of invalid parameter
    * @author Siberian89 | 2022-08-19 
    **/
    @isTest
    private static void getSelectAllFieldQueryStringTestException(){
        Test.startTest();
        Id testQuery = Utils.getSelectAllFieldQueryString('NotAnObject');
        Test.stopTest();

        Assert.isNull(testQuery, 'unexpected behavior with invalid parameter in getSelectAllFieldQueryString(String objApiName)');
    }
    /***** STOP getSelectAllFieldQueryString(String objApiName) TESTS *****/

    /***** START getValidPicklistValue(String valueToCheck, String objApiName, String fieldApiName) TESTS *****/
    /**
    * @description test method for getValidPicklistValue(String valueToCheck, String objApiName, String fieldApiName) in case of unrestricted standard parameter
    * @author Siberian89 | 2022-08-19 
    **/
    @isTest
    private static void getValidPicklistValueTestStandardPicklistParam(){
        List<Schema.PicklistEntry> pleLeadStatusList = Lead.Status.getDescribe().getPicklistValues();
        String valueToCheck = pleLeadStatusList[0].getValue();
        String objApiName = 'Lead';
        String fieldApiName = 'Status';

        Test.startTest();
        String returnedValue = Utils.getValidPicklistValue(valueToCheck, objApiName, fieldApiName);
        Test.stopTest();

        Assert.areEqual(valueToCheck, returnedValue, 'unexpected behavior with standard picklist parameter in getValidPicklistValue(String valueToCheck, String objApiName, String fieldApiName)');
    }

    //TODO: add more test to cover at 100%

    /***** STOP getValidPicklistValue(String valueToCheck, String objApiName, String fieldApiName) TESTS *****/


    /***** START isObjectCreateable(String objApiName, List<String> fieldApiNameList) TESTS *****/
    /**
    * @description test method for Utils.isObjectCreateable(String objApiName, List<String> fieldApiNameList) in case of correct parameter
    * @author Siberian89 | 2022-08-19 
    **/
    @isTest
    private static void isObjectCreateableTestCorrectParam(){
        String uniqueUserName = 'sysadmuser' + DateTime.now().getTime() + '@testorg.com';
        Profile sysAdmProfile = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
        User testAdminUser = new User(Alias = 'test0987', Email = uniqueUserName,
                                        EmailEncodingKey = 'UTF-8', LastName = 'Testing', LanguageLocaleKey = 'en_US',
                                        LocaleSidKey = 'en_US', ProfileId = sysAdmProfile.Id,
                                        TimeZoneSidKey = 'America/Los_Angeles',
                                        UserName = uniqueUserName);

        List<String> fieldApiNameList = new List<String>{'Name'};
        Boolean isCreateable;

        System.runAs(testAdminUser) {
            Test.startTest();
            isCreateable = Utils.isObjectCreateable('Account', fieldApiNameList);
            Test.stopTest();
        }

        Assert.isTrue(isCreateable, 'unexpected result for Admin in isObjectCreateable(String objApiName, List<String> fieldApiNameList)');
    }

    /**
    * @description test method for Utils.isObjectCreateable(String objApiName, List<String> fieldApiNameList) in case of blank parameter
    * @author Siberian89 | 2022-08-19 
    **/
    @isTest
    private static void isObjectCreateableTestNullParam(){
        Test.startTest();
        Boolean isCreateable = Utils.isObjectCreateable(null, null);
        Test.stopTest();

        Assert.isFalse(isCreateable, 'unexpected behavior with blank parameter in isObjectCreateable(String objApiName, List<String> fieldApiNameList)');
    }

    /**
    * @description test method for Utils.isObjectCreateable(String objApiName, List<String> fieldApiNameList) in case of invalid parameter
    * @author Siberian89 | 2022-08-19 
    **/
    @isTest
    private static void isObjectCreateableTestException(){
        List<String> fieldApiNameList = new List<String>{'Name'};
        Test.startTest();
        Boolean isCreateable = Utils.isObjectCreateable('NotAnObject',fieldApiNameList);
        Test.stopTest();

        Assert.isFalse(isCreateable, 'unexpected behavior with invalid parameter in isObjectCreateable(String objApiName, List<String> fieldApiNameList)');
    }
    /***** STOP isObjectCreateable(String objApiName, List<String> fieldApiNameList) TESTS *****/
    

    /***** START isObjectUpdateable(String objApiName, List<String> fieldApiNameList) TESTS *****/
    /**
    * @description test method for Utils.isObjectUpdateable(String objApiName, List<String> fieldApiNameList) in case of correct parameter
    * @author Siberian89 | 2022-08-19 
    **/
    @isTest
    private static void isObjectUpdateableTestCorrectParam(){
        String uniqueUserName = 'sysadmuser' + DateTime.now().getTime() + '@testorg.com';
        Profile sysAdmProfile = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
        User testAdminUser = new User(Alias = 'test0987', Email = uniqueUserName,
                                        EmailEncodingKey = 'UTF-8', LastName = 'Testing', LanguageLocaleKey = 'en_US',
                                        LocaleSidKey = 'en_US', ProfileId = sysAdmProfile.Id,
                                        TimeZoneSidKey = 'America/Los_Angeles',
                                        UserName = uniqueUserName);

        List<String> fieldApiNameList = new List<String>{'Name'};
        Boolean isUpdateable;

        System.runAs(testAdminUser) {
            Test.startTest();
            isUpdateable = Utils.isObjectUpdateable('Account', fieldApiNameList);
            Test.stopTest();
        }

        Assert.isTrue(isUpdateable, 'unexpected result for Admin in isObjectUpdateable(String objApiName, List<String> fieldApiNameList)');
    }

    /**
    * @description test method for Utils.isObjectUpdateable(String objApiName, List<String> fieldApiNameList) in case of blank parameter
    * @author Siberian89 | 2022-08-19 
    **/
    @isTest
    private static void isObjectUpdateableTestNullParam(){
        Test.startTest();
        Boolean isUpdateable = Utils.isObjectUpdateable(null, null);
        Test.stopTest();

        Assert.isFalse(isUpdateable, 'unexpected behavior with blank parameter in isObjectUpdateable(String objApiName, List<String> fieldApiNameList)');
    }

    /**
    * @description test method for Utils.isObjectUpdateable(String objApiName, List<String> fieldApiNameList) in case of invalid parameter
    * @author Siberian89 | 2022-08-19 
    **/
    @isTest
    private static void isObjectUpdateableTestException(){
        List<String> fieldApiNameList = new List<String>{'Name'};
        Test.startTest();
        Boolean isUpdateable = Utils.isObjectUpdateable('NotAnObject',fieldApiNameList);
        Test.stopTest();

        Assert.isFalse(isUpdateable, 'unexpected behavior with invalid parameter in isObjectUpdateable(String objApiName, List<String> fieldApiNameList)');
    }
    /***** STOP isObjectUpdateable(String objApiName, List<String> fieldApiNameList) TESTS *****/

}
