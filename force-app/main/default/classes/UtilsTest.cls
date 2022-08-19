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

}
