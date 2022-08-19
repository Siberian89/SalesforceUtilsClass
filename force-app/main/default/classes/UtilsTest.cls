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

    /**
    * @description test method for Utils.getObjectRecordTypeId in case of blank parameters
    * @author Siberian89 | 2022-08-19 
    **/
    @isTest
    private static void getObjectRecordTypeIdTestNullParam(){
        Test.startTest();
        Id testResultId = Utils.getObjectRecordTypeId('','');
        Test.stopTest();

        System.assertEquals(null, testResultId, 'unexpected behavior with blank parameters in getObjectRecordTypeId');
    }

    /**
    * @description test method for Utils.getObjectRecordTypeId in case of invalid parameters
    * @author Siberian89 | 2022-08-19 
    **/
    @isTest
    private static void getObjectRecordTypeIdTestException(){
        Test.startTest();
        Id testResultId = Utils.getObjectRecordTypeId('NotAnObject','NotARecordType');
        Test.stopTest();

        System.assertEquals(null, testResultId, 'unexpected behavior with invalid parameters in getObjectRecordTypeId');
    }

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

}
