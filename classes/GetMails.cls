public with sharing class GetMails {
    @AuraEnabled
    public static List<EmailWrapper> getMails(){
        try {
            HttpRequest req = new HttpRequest();
            req.setMethod('GET');
            req.setEndpoint('http://retrieveemail2.us-e2.cloudhub.io/');
            req.setTimeout(60 * 1000);
            Http h = new Http();
            HttpResponse res = h.send(req);
            //system.debug('response==>'+res.getBody());
            List<EmailWrapper> emailWrapperList = new List<EmailWrapper>();

            if(res.getStatusCode() == 201 || res.getStatusCode() == 200 ){
                List<Object> response =(List<Object>) JSON.deserializeUntyped(res.getBody());
                for(Object o : response){
                    map<string,Object> objectStr = new map<string,Object>();
                    objectStr = (map<string,Object>) o;
                    EmailWrapper obj = new EmailWrapper();
                    List<Object> fromList = (List<Object>) objectStr.get('from');
                    for(Object ob : fromList){
                        obj.recievedFrom = (string) ob;
                    }
                    obj.subject = (string) objectStr.get('subject');
                    obj.body = (string) objectStr.get('body');
                    obj.recievedDate = (string) objectStr.get('recievedDate');
                    emailWrapperList.add(obj);
                }
                system.debug(emailWrapperList);
            }
            return emailWrapperList;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    public class EmailWrapper {
        @AuraEnabled
        public string subject;
        @AuraEnabled
        public string body;
        @AuraEnabled
        public string recievedFrom;
        @AuraEnabled
        public string recievedDate;
    }
}