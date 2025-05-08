@isTest
private class CaseTriggerTest {
    @isTest
    static void testAutoSetSLA() {
        Case testCase = new Case(
            Subject = 'Test SLA',
            Priority = 'Medium',
            Status = 'New'
        );
        insert testCase;

        testCase.Priority = 'High';

        Test.startTest();
        update testCase;
        Test.stopTest();

        Case result = [SELECT Id, SLA__c FROM Case WHERE Id = :testCase.Id];
        System.assertEquals('24 Hours', result.SLA__c, 'SLA should be set to 24 Hours');
    }

    @isTest
    static void testNoOverwriteIfSLAAlreadySet() {
        Case testCase = new Case(
            Subject = 'Has SLA',
            Priority = 'High',
            Status = 'New',
            SLA__c = '48 Hours'
        );
        insert testCase;

        testCase.Status = 'Working';
        update testCase;

        Case result = [SELECT SLA__c FROM Case WHERE Id = :testCase.Id];
        System.assertEquals('48 Hours', result.SLA__c, 'Existing SLA should not be overwritten');
    }
}
