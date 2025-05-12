public with sharing class CaseTriggerHandler {
    public static Boolean isFirstRun = true;

    public static void autoSetSLA(List<Case> newCases, Map<Id, Case> oldCaseMap) {
        if (!isFirstRun) return; 
        isFirstRun = false;
        
        for (Case c : newCases) {
            Case oldC = oldCaseMap.get(c.Id);

            if (
                c.Priority == 'High' &&
                (oldC == null || oldC.Priority != 'High') &&
                String.isBlank(c.SLA__c)
            ) {
                c.SLA__c = '24 Hours';
            }
            
        }
    }
}