/**
 * @description       : Class containing test data creation methods
 * @author            : Siberian89
 * @group             : 
 * @created on        : 2022-12-09
 * @last modified on  : 2023-01-21
 * @last modified by  : Siberian89
**/
@isTest
public without sharing class TestDataFactory {

    /**
    * @description method to render visible the Standard Pricebook in test class
    * @author Siberian89 | 2022-12-09 
    * @return Id the standard pricebook Id
    **/
    public static Id createStandardPricebook(){
        Id pricebookId = Test.getStandardPricebookId();
        Pricebook2 testPriceBook = new Pricebook2(Id = pricebookId, isActive=true);
        update testPriceBook;
        return testPriceBook.Id;
    }
    
}