public with sharing class AccountTriggerHandler {
    public static void preventDeeleteIfOpenCases(List<Account> accountsToDelete){
       set<Id> accountIds = new Set<Id>();
         for (Account acc : accountsToDelete) {
              accountIds.add(acc.Id);
         }
         map<Id,Case> openCases = new map<Id,Case>();
            for (Case c : [SELECT Id, AccountId FROM Case WHERE AccountId IN :accountIds AND Status != 'Closed']) {
                openCases.put(c.AccountId, c);
            }

            for(Account a : accountsToDelete){
                if(openCases.get(a.Id) != null){
                    a.addError('Cannot delete account with open cases.');
                }
            }   
    }
}