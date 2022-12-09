/**
 * @description       : test Class for TestDataFactory
 * @author            : Siberian89
 * @group             : 
 * @created on        : 2022-12-09
 * @last modified on  : 2022-12-09
 * @last modified by  : Siberian89
**/
@isTest
private class TestDataFactoryTest {

    /***** START createStandardPricebook() TESTS *****/
    /**
    * @description test method for TestDataFactory.createStandardPricebook()
    * @author Siberian89 | 2022-12-09 
    **/
    @isTest
    private static void createStandardPricebookTest(){
        Id standardPricebookId = Test.getStandardPricebookId();
        Test.startTest();
        Id pricebookId = TestDataFactory.createStandardPricebook();
        Test.stopTest();
        System.assertEquals(standardPricebookId, pricebookId, 'Error creating test standard pricebook');
    }
    /***** STOP createStandardPricebook() TESTS *****/
    
}
