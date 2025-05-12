trigger ContactTrigger on Contact (after update,after insert,before delete) {
    if (Trigger.isAfter && Trigger.isUpdate) {
        ContactTriggerHandler.logFieldChanges(Trigger.new, Trigger.oldMap);
    }
    if(Trigger.isAfter && Trigger.isInsert) {
        ContactTriggerHandler.createWelcomeTasks(Trigger.new);
    }
    if (Trigger.isBefore && Trigger.isDelete) {
        ContactTriggerHandler.cleanupFieldChangeLogs(Trigger.old);
    }
}
