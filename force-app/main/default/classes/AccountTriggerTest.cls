@isTest
public class AccountTriggerTest {
    @isTest
    static void testPreventDeleteWhenOpenCasesExist() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        Case c = new Case(Subject = 'Test Case', Status = 'New', AccountId = acc.Id);
        insert c;

        Test.startTest();
        try {
            delete acc;
            System.assert(false, 'Account with open cases should not be deleted');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('Cannot delete'));
        }
        Test.stopTest();
    }

    @isTest
    static void testAllowDeleteWhenNoCasesExist() {
        Account acc = new Account(Name = 'No Cases');
        insert acc;

        Test.startTest();
        delete acc;
        Test.stopTest();
    }

}