public without sharing class ContactTriggerHandler {
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

    public static void createWelcomeTasks(List<Contact> newContactList) {
       List<Task> tasks = new List<Task>();
       for (Contact c : newContactList){
           Task t = new Task();
           t.Subject = 'Welcome Call';
           t.ActivityDate = System.today().addDays(7);
           t.whoId = c.Id;
           t.Priority = 'Normal';
           t.status = 'Not Started';
           tasks.add(t);
        }
        if(!tasks.isEmpty()){
            insert tasks;
        }
    }

    public static void cleanupFieldChangeLogs(List<Contact> deletedContacts){
        set <Id> contactIds = new set<Id>();
        for (Contact c : deletedContacts){
            contactIds.add(c.Id);
        }

        System.debug('Contact IDs: ' + contactIds);

        List<Field_Change_Log__c> logsToDelete = [SELECT Id FROM Field_Change_Log__c WHERE Contact__c IN :contactIds];
        
        System.debug('Logs to delete: ' + logsToDelete);

        if(!logsToDelete.isEmpty()){
            delete logsToDelete;
        }
    }


}