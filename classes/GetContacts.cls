public with sharing class GetContacts {
    @AuraEnabled
	public static List<Contact> getContactsController(string rcrdId){
		return [SELECT Id, FirstName, LastName FROM Contact WHERE id =: rcrdId LIMIT 10000];
	}

}