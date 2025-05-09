trigger ContactTrigger on Contact (after update,after insert) {
    if (Trigger.isAfter && Trigger.isUpdate) {
        ContactTriggerHandler.logFieldChanges(Trigger.new, Trigger.oldMap);
    }
    if(Trigger.isAfter && Trigger.isInsert) {
        ContactTriggerHandler.createWelcomeTasks(Trigger.new);
    }
}
