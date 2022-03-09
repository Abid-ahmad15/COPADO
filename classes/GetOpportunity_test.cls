@isTest
private class GetOpportunity_test {

    @IsTest
    static void testfetchAmount() {
   
        test.startTest();

        OpportunityDetail.opportunitySelectorObj = (opportunitySelector)Test.createStub(opportunitySelector.class, new MockOpportunity());
        Opportunity fetchDetail = OpportunityDetail.fetchAmount('0065g000002byuQAAQ');
        
        Test.stopTest();
        
        System.assertEquals(234567.00, fetchDetail.Amount);

       
    }
}