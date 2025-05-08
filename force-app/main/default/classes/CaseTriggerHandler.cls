public with sharing class CaseTriggerHandler {
    public static void autoSetSLA(List<Case> newCases, Map<Id, Case> oldCaseMap) {
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