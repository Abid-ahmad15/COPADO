/**
* @description class
  */
public with sharing class GetOpportunity {
   /**
    * @param record  for recordId
* @description  for method
* @return values
   */
  @AuraEnabled
   public static Opportunity fetchAmount(Id record){
       try {
           Opportunity amountinfo =[SELECT Amount,Account.Name,Bank_Name__c,Last_Transaction__c FROM Opportunity WHERE Id =: record WITH SECURITY_ENFORCED LIMIT 1];
           return amountinfo;
       } catch (Exception e) {
           throw new AuraHandledException(e.getMessage());
       }
   }
   /** 
    * @param record  for recordId
    * @param totalamount for totalamount
    * @param direction for direction
* @description  for class
* @return values
   */
  @AuraEnabled
   public static Opportunity updaterecord(Id record , string totalamount , string direction){


    try {

        if(Opportunity.SObjectType.getDescribe().isUpdateable()){
    Opportunity opportDetail = [SELECT Amount,Last_Transaction__c FROM Opportunity WHERE Id =: record WITH SECURITY_ENFORCED LIMIT 1];
    opportDetail.Amount =  decimal.valueof(totalamount);
    opportDetail.Last_Transaction__c =  direction;
    update opportDetail;
    return opportDetail;

  }
  return null;
       } catch (Exception e) {
           throw new AuraHandledException(e.getMessage());
       }
   }

}