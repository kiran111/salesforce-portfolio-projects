trigger ContactTrigger on Contact (after update) {
    if (Trigger.isAfter && Trigger.isUpdate) {
        ContactTriggerHandler.logFieldChanges(Trigger.new, Trigger.oldMap);
    }
}
