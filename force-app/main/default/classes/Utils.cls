/**
 * @description       : class containing utility methods in alphabetical order
 * @author            : Siberian89
 * @group             : 
 * @created on        : 2022-08-19
 * @last modified on  : 2022-08-19
 * @last modified by  : Siberian89
**/
public inherited sharing class Utils {

    /**
    * @description method to get a RecordTypeId of an Object from an Object Api Name and a RecordType Developer Name
    * @author Siberian89 | 2022-08-19 
    * @param objApiName Object Api Name
    * @param rtDevName RecordType Developer Name
    * @return Id recordTypeId or null
    **/
    public static Id getObjectRecordTypeId(String objApiName, String rtDevName){
        Id recordTypeId;
        if (String.isBlank(objApiName) || String.isBlank(rtDevName)){
            return null;
        }
        try{
            recordTypeId = Schema.getGlobalDescribe().get(objApiName).getDescribe().getRecordTypeInfosByDeveloperName().get(rtDevName).getRecordTypeId();
        }catch(Exception ex){
            System.debug(logginglevel.ERROR, ex.getMessage() + ' ' + ex.getStackTraceString());
        }
        return recordTypeId;
    }

    /**
    * @description returns a stirng query like 'SELECT * FROM sObject' adding all fields to the query
    * @author Siberian89 | 2022-08-19 
    * @param objApiName Object Api Name
    * @return String queryString containing all the fields or null
    **/
    public static String getSelectAllFieldQueryString(String objApiName){
        if(String.isBlank(objApiName)){
            return null;
        }

        String queryString = null;
        try{
            Map<String, Schema.SObjectField> fieldMap = Schema.getGlobalDescribe().get(objApiName).getDescribe().fields.getMap();
            queryString = 'SELECT ';

            for(String fieldApiName: fieldMap.KeySet()){
                if(fieldMap.get(fieldApiName).getDescribe().getType() == Schema.DisplayType.Picklist){
                    queryString += 'toLabel('+ fieldApiName + '), ';
                }else{
                    queryString += fieldApiName + ', ';
                }
            }

            queryString = (queryString.endsWith(',')) ? queryString.removeEnd(', ') : queryString + 'Id';
            queryString += ' FROM ' + objApiName;
        }catch(Exception ex){
            System.debug(logginglevel.ERROR, ex.getMessage() + ' ' + ex.getStackTraceString());
        }        
          
        return queryString;
    }
    
}
