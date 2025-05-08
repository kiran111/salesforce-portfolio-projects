trigger LeadTrigger on Lead (after insert, after update) {
    if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) {
        LeadTriggerHandler.autoConvertLeads(Trigger.new);
    }
}
