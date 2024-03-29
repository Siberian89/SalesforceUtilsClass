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


    /***** START getDateFromStringFormatAAAAMMDD(String dateAAAAMMDD) TESTS *****/
    /**
    * @description test method for Utils.getCronExpressionStringFromDateTime(DateTime dtToFormat) in case of correct parameter
    * @author Siberian89 | 2023-06-02 
    **/
    @isTest
    private static void getDateFromStringFormatAAAAMMDDTestCorrectParam(){
        Date dateToTest = Date.today();
        String dateAAAAMMDD = '' + dateToTest.year();
        if(dateToTest.month() < 10){
            dateAAAAMMDD += '0' + dateToTest.month();
        }else{
            dateAAAAMMDD += dateToTest.month();
        }
        if(dateToTest.day() < 10){
            dateAAAAMMDD += '0' + dateToTest.day();
        }else{
            dateAAAAMMDD += dateToTest.day();
        }

        Test.startTest();
        Date returnedDate = Utils.getDateFromStringFormatAAAAMMDD(dateAAAAMMDD);
        Test.stopTest();

        Assert.areEqual(dateToTest, returnedDate, 'unexpected behavior with correct parameter in getDateFromStringFormatAAAAMMDD(String dateAAAAMMDD)');
    }

    /**
    * @description test method for Utils.getCronExpressionStringFromDateTime(DateTime dtToFormat) in case of correct parameter with dashes
    * @author Siberian89 | 2023-06-02 
    **/
    @isTest
    private static void getDateFromStringFormatAAAAMMDDTestCorrectAndDashesParam(){
        Date dateToTest = Date.today();
        String dateAAAAMMDD = '' + dateToTest.year() + '-';
        if(dateToTest.month() < 10){
            dateAAAAMMDD += '0' + dateToTest.month();
        }else{
            dateAAAAMMDD += dateToTest.month();
        }
        dateAAAAMMDD += '-';
        if(dateToTest.day() < 10){
            dateAAAAMMDD += '0' + dateToTest.day();
        }else{
            dateAAAAMMDD += dateToTest.day();
        }

        Test.startTest();
        Date returnedDate = Utils.getDateFromStringFormatAAAAMMDD(dateAAAAMMDD);
        Test.stopTest();

        Assert.areEqual(dateToTest, returnedDate, 'unexpected behavior with correct parameter with dashes in getDateFromStringFormatAAAAMMDD(String dateAAAAMMDD)');
    }

    /**
    * @description test method for Utils.getCronExpressionStringFromDateTime(DateTime dtToFormat) in case of empty parameter
    * @author Siberian89 | 2023-06-02 
    **/
    @isTest
    private static void getDateFromStringFormatAAAAMMDDTestEmptyParam(){
        String dateAAAAMMDD = '';

        Test.startTest();
        Date returnedDate = Utils.getDateFromStringFormatAAAAMMDD(dateAAAAMMDD);
        Test.stopTest();

        Assert.isNull(returnedDate, 'unexpected behavior with empty parameter in getDateFromStringFormatAAAAMMDD(String dateAAAAMMDD)');
    }

    /**
    * @description test method for Utils.getCronExpressionStringFromDateTime(DateTime dtToFormat) in case of invalid parameter
    * @author Siberian89 | 2023-06-02 
    **/
    @isTest
    private static void getDateFromStringFormatAAAAMMDDTestInvalidParam(){
        String year = 'YYYY';
        String month = 'MM';
        String day = 'DD';
        String dateAAAAMMDD = '' + year + '-' + month + '-' + day;

        Test.startTest();
        Date returnedDate = Utils.getDateFromStringFormatAAAAMMDD(dateAAAAMMDD);
        Test.stopTest();

        Assert.isNull(returnedDate, 'unexpected behavior with invalid parameter in getDateFromStringFormatAAAAMMDD(String dateAAAAMMDD)');
    }

    /**
    * @description test method for Utils.getCronExpressionStringFromDateTime(DateTime dtToFormat) in case of invalid date parameter
    * @author Siberian89 | 2023-06-02 
    **/
    @isTest
    private static void getDateFromStringFormatAAAAMMDDTestInvalidDateParam(){
        String year = '9999';
        String month = '99';
        String day = '99';
        String dateAAAAMMDD = '' + year + '-' + month + '-' + day;

        Test.startTest();
        Date returnedDate = Utils.getDateFromStringFormatAAAAMMDD(dateAAAAMMDD);
        Test.stopTest();

        Assert.isNull(returnedDate, 'unexpected behavior with invalid date parameter in getDateFromStringFormatAAAAMMDD(String dateAAAAMMDD)');
    }
    /***** STOP getDateFromStringFormatAAAAMMDD(String dateAAAAMMDD) TESTS *****/


    /***** START getObjectRecordTypeIdFromDeveloperName(String objApiName, String rtDevName) TESTS *****/
    /**
    * @description test method for Utils.getObjectRecordTypeIdFromDeveloperName(String objApiName, String rtDevName) in case of invalid parameters
    * @author Siberian89 | 2022-08-19 
    **/
    @isTest
    private static void getObjectRecordTypeIdFromDeveloperNameTestException(){
        String objApiName = 'NotAnObject';
        String rtDevName = '';

        Test.startTest();
        Id testResultId = Utils.getObjectRecordTypeIdFromDeveloperName(objApiName,rtDevName);
        Test.stopTest();

        Assert.isNull(testResultId, 'unexpected behavior with invalid parameters in getObjectRecordTypeIdFromDeveloperName(String objApiName, String rtDevName)');
    }
    /***** STOP getObjectRecordTypeIdFromDeveloperName(String objApiName, String rtDevName) TESTS *****/


    /***** START getObjectRecordTypeIdFromName(String objApiName, String rtName) TESTS *****/
    /**
    * @description test method for Utils.getObjectRecordTypeIdFromName(String objApiName, String rtDevName) in case of invalid parameters
    * @author Siberian89 | 2022-08-19 
    **/
    @isTest
    private static void getObjectRecordTypeIdFromNameTestException(){
        String objApiName = 'NotAnObject';
        String rtDevName = '';

        Test.startTest();
        Id testResultId = Utils.getObjectRecordTypeIdFromName(objApiName,rtDevName);
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
        String objApiName = 'NotAnObject';
        String rtDevName = '';

        Test.startTest();
        String testResultDeveloperName = Utils.getObjectRecordTypeDeveloperNameFromRecordTypeId(objApiName,rtDevName);
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
        String objApiName = 'NotAnObject';
        String rtDevName = '';

        Test.startTest();
        String testResultName = Utils.getObjectRecordTypeNameFromRecordTypeId(objApiName,rtDevName);
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
        String objApiName = 'Account';

        Test.startTest();
        String testQuery = Utils.getSelectAllFieldQueryString(objApiName);
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
        String objApiName = 'NotAnObject';

        Test.startTest();
        Id testQuery = Utils.getSelectAllFieldQueryString(objApiName);
        Test.stopTest();

        Assert.isNull(testQuery, 'unexpected behavior with invalid parameter in getSelectAllFieldQueryString(String objApiName)');
    }
    /***** STOP getSelectAllFieldQueryString(String objApiName) TESTS *****/


    /***** START getValidPicklistValue(String valueToCheck, String objApiName, String fieldApiName) TESTS *****/
    /**
    * @description test method for getValidPicklistValue(String valueToCheck, String objApiName, String fieldApiName) in case of unrestricted standard parameter
    * @author Siberian89 | 2023-06-02 
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

        String objApiName = 'Account';
        List<String> fieldApiNameList = new List<String>{'Name'};
        Boolean isCreateable;

        System.runAs(testAdminUser) {
            Test.startTest();
            isCreateable = Utils.isObjectCreateable(objApiName, fieldApiNameList);
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
        String objApiName = 'NotAnObject';
        List<String> fieldApiNameList = new List<String>{'Name'};

        Test.startTest();
        Boolean isCreateable = Utils.isObjectCreateable(objApiName,fieldApiNameList);
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

        String objApiName = 'Account';
        List<String> fieldApiNameList = new List<String>{'Name'};
        Boolean isUpdateable;

        System.runAs(testAdminUser) {
            Test.startTest();
            isUpdateable = Utils.isObjectUpdateable(objApiName, fieldApiNameList);
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
        String objApiName = 'NotAnObject';
        List<String> fieldApiNameList = new List<String>{'Name'};
        
        Test.startTest();
        Boolean isUpdateable = Utils.isObjectUpdateable(objApiName,fieldApiNameList);
        Test.stopTest();

        Assert.isFalse(isUpdateable, 'unexpected behavior with invalid parameter in isObjectUpdateable(String objApiName, List<String> fieldApiNameList)');
    }
    /***** STOP isObjectUpdateable(String objApiName, List<String> fieldApiNameList) TESTS *****/

}
