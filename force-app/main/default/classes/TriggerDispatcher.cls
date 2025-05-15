public with sharing class TriggerDispatcher {
    public static void run(ObjectTriggerHandler handler) {
        if (Trigger.isBefore && Trigger.isInsert) {
            handler.beforeInsert(Trigger.new);
        } else if (Trigger.isBefore && Trigger.isUpdate) {
            handler.beforeUpdate(Trigger.new, Trigger.oldMap);
        } else if (Trigger.isBefore && Trigger.isDelete) {
            handler.beforeDelete(Trigger.old);
        }

        if (Trigger.isAfter && Trigger.isInsert) {
            handler.afterInsert(Trigger.new);
        } else if (Trigger.isAfter && Trigger.isUpdate) {
            handler.afterUpdate(Trigger.new, Trigger.oldMap);
        } else if (Trigger.isAfter && Trigger.isDelete) {
            handler.afterDelete(Trigger.old);
        }
    }
}
