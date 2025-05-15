trigger ContactTrigger on Contact (before insert, before update, before delete,
after insert, after update, after delete) {
  /*  if (Trigger.isAfter && Trigger.isUpdate) {
        ContactTriggerHandler.logFieldChanges(Trigger.new, Trigger.oldMap);
    }
    if(Trigger.isAfter && Trigger.isInsert) {
        ContactTriggerHandler.createWelcomeTasks(Trigger.new);
    }
    if (Trigger.isBefore && Trigger.isDelete) {
        ContactTriggerHandler.cleanupFieldChangeLogs(Trigger.old);
    } */

     TriggerDispatcher.run(new ContactTriggerHandler());

}
