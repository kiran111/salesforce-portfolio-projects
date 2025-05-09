public with sharing class ContactTriggerHandler {
    public static void logFieldChanges(List<Contact> newList, Map<Id, Contact> oldMap) {
        List<Field_Change_Log__c> logs = new List<Field_Change_Log__c>();

        for (Contact c : newList) {
            Contact oldC = oldMap.get(c.Id);

            if (c.Email != oldC.Email) {
                logs.add(createLog(c.Id, 'Email', oldC.Email, c.Email));
            }

            if (c.Phone != oldC.Phone) {
                logs.add(createLog(c.Id, 'Phone', oldC.Phone, c.Phone));
            }
        }

        if (!logs.isEmpty()) {
            insert logs;
        }
    }

    private static Field_Change_Log__c createLog(Id contactId, String fieldName, String oldVal, String newVal) {
        return new Field_Change_Log__c(
            Contact__c = contactId,
            Field_Name__c = fieldName,
            Old_Value__c = oldVal,
            New_Value__c = newVal,
            Changed_On__c = System.now()
        );
    }
}