/**
 * @description       : class containing utility methods in alphabetical order
 * @author            : Siberian89
 * @group             : 
 * @created on        : 2022-08-19
 * @last modified on  : 2023-06-02
 * @last modified by  : Siberian89
**/
public inherited sharing class Utils {

    /**
    * @description method to format a DateTime into a string cron expression
    * @author Siberian89 | 2022-09-02 
    * @param dtToFormat DateTime to format
    * @return String cron expression or null
    **/
    public static String getCronExpressionStringFromDateTime(DateTime dtToFormat){
        String cronExpression;

        try{
            cronExpression = dtToFormat.format('s m H d M \'?\' yyyy');
        }catch(Exception ex){
            System.debug(logginglevel.ERROR, ex.getMessage() + ' ' + ex.getStackTraceString());
        }

        return cronExpression;
    }

    /**
    * @description 
    * @author Siberian89 | 2023-06-02 
    * @param dateAAAAMMDD string formatted ad AAAAMMDD or AAAA-MM-DD
    * @return Date correctly parsed date from the string or null
    **/
    public static Date getDateFromStringFormatAAAAMMDD(String dateAAAAMMDD){
        String stringDate = dateAAAAMMDD.remove('');
        if(String.isBlank(stringDate) || (stringDate.length() != 8 && stringDate.length() != 10)){
            return null;
        }

        if(stringDate.length() == 10){
            stringDate = stringDate.remove('-');
        }
        
        try{
            Integer year = Integer.valueOf(stringDate.substring(0, 4));
            Integer month = Integer.valueOf(stringDate.substring(4, 6));
            Integer day = Integer.valueOf(stringDate.substring(6));
        
            Date dateToReturn = Date.newinstance(year, month, day);

            if(!(dateToReturn.year() == year && dateToReturn.month() == month && dateToReturn.day() == day)){
                throw new HandledException('Data not valid parsed from ' + dateAAAAMMDD);
            }

            return dateToReturn;
        }catch(Exception ex){
            System.debug(logginglevel.ERROR, ex.getMessage() + ' ' + ex.getStackTraceString());
            return null;
        }
    }

    /**
    * @description method to get a RecordTypeId of an Object from an Object Api Name and a RecordType Developer Name
    * @author Siberian89 | 2022-08-19 
    * @param objApiName Object Api Name
    * @param rtDevName RecordType Developer Name
    * @return Id recordTypeId or null
    **/
    public static Id getObjectRecordTypeIdFromDeveloperName(String objApiName, String rtDevName){
        Id recordTypeId;

        try{
            recordTypeId = Schema.getGlobalDescribe().get(objApiName).getDescribe().getRecordTypeInfosByDeveloperName().get(rtDevName).getRecordTypeId();
        }catch(Exception ex){
            System.debug(logginglevel.ERROR, ex.getMessage() + ' ' + ex.getStackTraceString());
        }

        return recordTypeId;
    }

    /**
    * @description method to get a RecordTypeId of an Object from an Object Api Name and a RecordType Name
    * @author Siberian89 | 2022-09-01 
    * @param objApiName Object Api Name
    * @param rtName RecordType Name
    * @return Id recordTypeId or null
    **/
    public static Id getObjectRecordTypeIdFromName(String objApiName, String rtName){
        Id recordTypeId;

        try{
            recordTypeId = Schema.getGlobalDescribe().get(objApiName).getDescribe().getRecordTypeInfosByName().get(rtName).getRecordTypeId();
        }catch(Exception ex){
            System.debug(logginglevel.ERROR, ex.getMessage() + ' ' + ex.getStackTraceString());
        }

        return recordTypeId;
    }

    /**
    * @description method to get a RecordType Developer Name of an Object from an Object Api Name and a RecordType Id
    * @author Siberian89 | 2022-09-01 
    * @param objApiName Object Api Name
    * @param rtId RecordType Id
    * @return String recordType Developer name or null
    **/
    public static String getObjectRecordTypeDeveloperNameFromRecordTypeId(String objApiName, String rtId){
        String recordTypeDeveloperName;

        try{
            recordTypeDeveloperName = Schema.getGlobalDescribe().get(objApiName).getDescribe().getRecordTypeInfosById().get(rtId).getDeveloperName();
        }catch(Exception ex){
            System.debug(logginglevel.ERROR, ex.getMessage() + ' ' + ex.getStackTraceString());
        }

        return recordTypeDeveloperName;
    }

    /**
    * @description method to get a RecordType Name of an Object from an Object Api Name and a RecordType Id
    * @author Siberian89 | 2022-09-01 
    * @param objApiName Object Api Name
    * @param rtId RecordType Id
    * @return String recordType name or null
    **/
    public static String getObjectRecordTypeNameFromRecordTypeId(String objApiName, String rtId){
        String recordTypeName;

        try{
            recordTypeName = Schema.getGlobalDescribe().get(objApiName).getDescribe().getRecordTypeInfosById().get(rtId).getName();
        }catch(Exception ex){
            System.debug(logginglevel.ERROR, ex.getMessage() + ' ' + ex.getStackTraceString());
        }

        return recordTypeName;
    }

    /**
    * @description returns a stirng query like 'SELECT * FROM sObject' adding all fields to the query
    * @author Siberian89 | 2022-08-19 
    * @param objApiName Object Api Name
    * @return String queryString containing all the fields or null
    **/
    public static String getSelectAllFieldQueryString(String objApiName){
        String queryString;

        try{
            Map<String, Schema.SObjectField> fieldMap = Schema.getGlobalDescribe().get(objApiName).getDescribe().fields.getMap();
            queryString = 'SELECT ';

            for(String fieldApiName: fieldMap.KeySet()){
                if(fieldMap.get(fieldApiName).getDescribe().getType() == Schema.DisplayType.Picklist){
                    queryString += 'toLabel(' + fieldApiName + '), ';
                }else{
                    queryString += fieldApiName + ', ';
                }
            }

            //there are no cases where an object exists but has no fields
            queryString = queryString.removeEnd(', ') + ' FROM ' + objApiName;
        }catch(Exception ex){
            System.debug(logginglevel.ERROR, ex.getMessage() + ' ' + ex.getStackTraceString());
            queryString = null;
        }

        return queryString;
    }

    /**
    * @description check if a value is valid for a picklist field and returns a valid value
    * @author Siberian89 | 2023-06-02 
    * @param valueToCheck value to check if valid for the picklist field
    * @param objApiName object api name which contains the picklist field
    * @param fieldApiName picklist field api name
    * @return String value set in input if is valid or null
    **/
    public static String getValidPicklistValue(String valueToCheck, String objApiName, String fieldApiName){
        Schema.DescribeFieldResult describeFieldResult = Schema.getGlobalDescribe().get(objApiName).getDescribe().fields.getMap().get(fieldApiName).getDescribe();

        if(!describeFieldResult.isRestrictedPicklist()){
            return valueToCheck;
        }

        List<Schema.PicklistEntry> pleList = describeFieldResult.getPicklistValues();
        Boolean isValueToCheckValid = false;
        for(Integer i = 0; i < pleList.size(); i++){
            if(valueToCheck == pleList[i].getValue()){
                isValueToCheckValid = true;
                break;
            }
        }
        return (isValueToCheckValid) ? valueToCheck : null;
    }

    /**
    * @description check if an user can create an object with the specified fields
    * @author Siberian89 | 2022-08-19 
    * @param objApiName Object Api Name
    * @param fieldApiNameList List of Fields Api Name to check
    * @return boolean isCreateable true if the user can create the object with all the specified fields, otherwise false
    **/
    public static boolean isObjectCreateable(String objApiName, List<String> fieldApiNameList){
        if(fieldApiNameList == null || fieldApiNameList.isEmpty()){
            return false;
        }

        Boolean isCreateable = true;

        try{
            Map<String, Schema.SObjectField> fieldMap = Schema.getGlobalDescribe().get(objApiName).getDescribe().fields.getMap();
            for(String fieldApiName : fieldApiNameList){
                isCreateable = isCreateable && fieldMap.get(fieldApiName).getDescribe().isCreateable();
            }
        }catch(Exception ex){
            System.debug(logginglevel.ERROR, ex.getMessage() + ' ' + ex.getStackTraceString());
            isCreateable = false;
        }
        
        return isCreateable;
    }

    /**
    * @description check if an user can update an object with the specified fields
    * @author Siberian89 | 2022-08-19 
    * @param objApiName Object Api Name
    * @param fieldApiNameList List of Fields Api Name to check
    * @return boolean isUpdateable true if the user can update the object with all the specified fields, otherwise false
    **/
    public static boolean isObjectUpdateable(String objApiName, List<String> fieldApiNameList){
        if(fieldApiNameList == null || fieldApiNameList.isEmpty()){
            return false;
        }

        Boolean isUpdateable = true;
        
        try{
            Map<String, Schema.SObjectField> fieldMap = Schema.getGlobalDescribe().get(objApiName).getDescribe().fields.getMap();
            for(String fieldApiName : fieldApiNameList){
                isUpdateable = isUpdateable && fieldMap.get(fieldApiName).getDescribe().isUpdateable();
            }
        }catch(Exception ex){
            System.debug(logginglevel.ERROR, ex.getMessage() + ' ' + ex.getStackTraceString());
            isUpdateable = false;
        }

        return isUpdateable;
    }
    
}
