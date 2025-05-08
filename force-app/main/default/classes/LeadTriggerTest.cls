@isTest
private class LeadTriggerTest {
    @isTest
    static void testLeadAutoConvert() {
        // Create a Lead with required fields and trigger condition
        Lead testLead = new Lead(
            FirstName = 'Auto',
            LastName = 'Convert',
            Company = 'Test Co',
            Status = 'Open - Not Contacted', // Use an active status in your org
            Auto_Convert__c = true
        );
        insert testLead;

        // Re-query the Lead to check conversion
        Lead result = [SELECT Id, IsConverted FROM Lead WHERE Id = :testLead.Id];
        System.assertEquals(true, result.IsConverted, 'Lead should be converted');
    }
}