# Lead Auto-Conversion Trigger

Automatically converts Leads when the `Auto_Convert__c` checkbox is checked.

## What it does:
- Runs in `after insert` and `after update`
- Converts leads into Accounts & Contacts automatically
- Skips Opportunity creation

## Files:
- LeadTrigger.trigger
- LeadTriggerHandler.cls
- LeadTriggerTest.cls

## Test Coverage:
✔ Trigger handler covered by `LeadTriggerTest.cls`  
✔ Can be deployed with `sf project deploy start`

