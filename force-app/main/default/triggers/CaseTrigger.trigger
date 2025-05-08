trigger CaseTrigger on Case (before update) {
    if (Trigger.isBefore && Trigger.isUpdate) {
        CaseTriggerHandler.autoSetSLA(Trigger.new, Trigger.oldMap);
    }
}
