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

    @isTest
    static void testPreventDuplicateEmail() {
        Lead existing = new Lead(
            FirstName = 'Jane', LastName = 'Doe', Email = 'test@example.com', Company = 'ABC'
        );
        insert existing;

        Lead duplicate = new Lead(
            FirstName = 'John', LastName = 'Smith', Email = 'test@example.com', Company = 'XYZ'
        );

        Test.startTest();
        try {
            insert duplicate;
            System.assert(false, 'Duplicate insert should have failed');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('already exists'));
        }
        Test.stopTest();
    }

    @isTest
    static void testValidInsert() {
        Lead valid = new Lead(
            FirstName = 'Alice', LastName = 'Smith', Email = 'unique@example.com', Company = 'DEF'
        );
        insert valid;
        System.assertNotEquals(null, valid.Id);
    }

}