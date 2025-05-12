@isTest
private class ContactTriggerTest {
    @isTest
    static void testFieldChangeLogging() {
        Contact c = new Contact(FirstName = 'Test', LastName = 'User', Email = 'one@example.com', Phone = '123456');
        insert c;

        c.Email = 'two@example.com';
        c.Phone = '789012';
        update c;

        List<Field_Change_Log__c> logs = [
            SELECT Field_Name__c, Old_Value__c, New_Value__c 
            FROM Field_Change_Log__c 
            WHERE Contact__c = :c.Id
        ];

        System.assertEquals(2, logs.size());
    }

    @isTest
    static void testWelcomeTaskCreation() {
        Contact c = new Contact(FirstName = 'Test', LastName = 'User');
        insert c;

        List<Task>tasks = [Select Id, Subject, ActivityDate, WhatId, Priority, Status From Task Where WhoId = :c.Id];
        System.assertEquals(1, tasks.size());
        System.assertEquals('Welcome Call', tasks[0].Subject);
        System.assertEquals(System.today().addDays(7), tasks[0].ActivityDate);
    }

    @isTest
    static void testFieldChangeLogCleanup() {
        
        Contact c = new Contact(FirstName = 'Test', LastName = 'User');
        insert c;

        Field_Change_Log__c log1 = new Field_Change_Log__c(
            Contact__c = c.Id,
            Field_Name__c = 'Email'
        );

        Field_Change_Log__c log2 = new Field_Change_Log__c(
            Contact__c = c.Id,
            Field_Name__c = 'Phone'
        );

        insert new List<Field_Change_Log__c>{log1, log2};

        Test.startTest();
         delete c;
        Test.stopTest();

        List<Field_Change_Log__c> logs = [
            SELECT Id 
            FROM Field_Change_Log__c 
            WHERE Contact__c = :c.Id
        ];
        
        System.assertEquals(0, logs.size(), 'Logs should be deleted when the contact is deleted');

        }
}
