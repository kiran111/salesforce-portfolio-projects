@isTest
private class ContactTriggerHandlerTest {

    @isTest
    static void testAfterInsertCreatesWelcomeTask() {
        // Insert test Contact
        Contact c = new Contact(FirstName = 'Test', LastName = 'Insert');
        insert c;

        // Verify welcome Task
        List<Task> tasks = [SELECT Subject, WhoId FROM Task WHERE WhoId = :c.Id];
        System.assertEquals(1, tasks.size(), 'One Welcome Task should be created');
        System.assertEquals('Welcome Call', tasks[0].Subject);
    }

    @isTest
    static void testAfterUpdateLogsFieldChanges() {
        // Insert Contact
        Contact c = new Contact(FirstName = 'Test', LastName = 'Update', Email = 'old@example.com', Phone = '111-111-1111');
        insert c;

        // Update Email and Phone
        c.Email = 'new@example.com';
        c.Phone = '999-999-9999';
        update c;

        // Verify change logs
        List<Field_Change_Log__c> logs = [
            SELECT Field_Name__c, Old_Value__c, New_Value__c
            FROM Field_Change_Log__c
            WHERE Contact__c = :c.Id
        ];
        System.assertEquals(2, logs.size(), 'Two field change logs should be created');
    }

    @isTest
    static void testBeforeDeleteCleansUpLogs() {
        // Insert and update Contact to create logs
        Contact c = new Contact(FirstName = 'Test', LastName = 'Delete', Email = 'one@example.com');
        insert c;

        c.Email = 'two@example.com';
        update c;

        // Confirm logs exist
        List<Field_Change_Log__c> beforeDeleteLogs = [SELECT Id FROM Field_Change_Log__c WHERE Contact__c = :c.Id];
        System.assert(beforeDeleteLogs.size() > 0, 'Logs should exist before delete');

        // Delete Contact
        delete c;

        // Confirm logs are deleted
        List<Field_Change_Log__c> afterDeleteLogs = [SELECT Id FROM Field_Change_Log__c WHERE Contact__c = :c.Id];
        System.assertEquals(0, afterDeleteLogs.size(), 'Logs should be deleted with contact');
    }
}