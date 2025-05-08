trigger LeadTrigger on Lead (before insert, before update,after insert, after update) {
    if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) {
        LeadTriggerHandler.autoConvertLeads(Trigger.new);
    }
    if (Trigger.isBefore && Trigger.isInsert) {
        LeadTriggerHandler.preventDuplicateLeads(Trigger.new);
    }
}
