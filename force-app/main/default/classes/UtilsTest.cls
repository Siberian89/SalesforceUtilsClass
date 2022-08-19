/**
 * @description       : test class for Utils class
 * @author            : Siberian89
 * @group             :
 * @created on        : 2022-08-19 
 * @last modified on  : 2022-08-19
 * @last modified by  : Siberian89
**/
@isTest
private class UtilsTest {

    //START getObjectRecordTypeId(String objApiName, String rtDevName) TESTS
    /**
    * @description test method for Utils.getObjectRecordTypeId(String objApiName, String rtDevName) in case of blank parameters
    * @author Siberian89 | 2022-08-19 
    **/
    @isTest
    private static void getObjectRecordTypeIdTestNullParam(){
        Test.startTest();
        Id testResultId = Utils.getObjectRecordTypeId('','');
        Test.stopTest();

        System.assertEquals(null, testResultId, 'unexpected behavior with blank parameters in getObjectRecordTypeId(String objApiName, String rtDevName)');
    }

    /**
    * @description test method for Utils.getObjectRecordTypeId(String objApiName, String rtDevName) in case of invalid parameters
    * @author Siberian89 | 2022-08-19 
    **/
    @isTest
    private static void getObjectRecordTypeIdTestException(){
        Test.startTest();
        Id testResultId = Utils.getObjectRecordTypeId('NotAnObject','NotARecordType');
        Test.stopTest();

        System.assertEquals(null, testResultId, 'unexpected behavior with invalid parameters in getObjectRecordTypeId(String objApiName, String rtDevName)');
    }
    //STOP getObjectRecordTypeId(String objApiName, String rtDevName) TESTS

    //START getSelectAllFieldQueryString(String objApiName) TESTS
    /**
    * @description test method for Utils.getSelectAllFieldQueryString(String objApiName) in case of correct parameter
    * @author Siberian89 | 2022-08-19 
    **/
    @isTest
    private static void getSelectAllFieldQueryStringTestCorrectParam(){
        Test.startTest();
        String testQuery = Utils.getSelectAllFieldQueryString('Account');
        Test.stopTest();

        System.assertEquals(true, String.isNotBlank(testQuery), 'empty query returned by getSelectAllFieldQueryString(String objApiName)');
        System.assertEquals(true, testQuery.startsWith('SELECT '), 'incorrect query returned by getSelectAllFieldQueryString(String objApiName)');
    }

    /**
    * @description test method for Utils.getSelectAllFieldQueryString(String objApiName) in case of blank parameter
    * @author Siberian89 | 2022-08-19 
    **/
    @isTest
    private static void getSelectAllFieldQueryStringTestNullParam(){
        Test.startTest();
        String testQuery = Utils.getSelectAllFieldQueryString('');
        Test.stopTest();

        System.assertEquals(null, testQuery, 'unexpected behavior with blank parameter in getSelectAllFieldQueryString(String objApiName)');
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

        System.assertEquals(null, testQuery, 'unexpected behavior with invalid parameter in getSelectAllFieldQueryString(String objApiName)');
    }
    //STOP getSelectAllFieldQueryString(String objApiName) TESTS

    //START isObjectCreateable(String objApiName, List<String> fieldApiNameList) TESTS
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

        System.assertEquals(true, isCreateable, 'unexpected result for Admin in isObjectCreateable(String objApiName, List<String> fieldApiNameList)');
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

        System.assertEquals(false, isCreateable, 'unexpected behavior with blank parameter in isObjectCreateable(String objApiName, List<String> fieldApiNameList)');
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

        System.assertEquals(false, isCreateable, 'unexpected behavior with invalid parameter in isObjectCreateable(String objApiName, List<String> fieldApiNameList)');
    }
    //STOP isObjectCreateable(String objApiName, List<String> fieldApiNameList) TESTS

    //START isObjectUpdateable(String objApiName, List<String> fieldApiNameList) TESTS
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

        System.assertEquals(true, isUpdateable, 'unexpected result for Admin in isObjectUpdateable(String objApiName, List<String> fieldApiNameList)');
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

        System.assertEquals(false, isUpdateable, 'unexpected behavior with blank parameter in isObjectUpdateable(String objApiName, List<String> fieldApiNameList)');
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

        System.assertEquals(false, isUpdateable, 'unexpected behavior with invalid parameter in isObjectUpdateable(String objApiName, List<String> fieldApiNameList)');
    }
    //STOP isObjectUpdateable(String objApiName, List<String> fieldApiNameList) TESTS

}
