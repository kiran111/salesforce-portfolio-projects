# Auto-Set SLA on Case (Before Update Trigger)

## Objective

Automatically sets the `SLA__c` field to `"24 Hours"` when a Case is updated to High Priority and SLA is blank.

## Use Case

Many organizations use SLAs for resolution timing. This trigger ensures high-priority cases aren’t missing them.

## Trigger Type

- `before update`

## Logic Details

- Only runs when:
  - Case Priority = "High"
  - SLA__c is blank
  - Priority changed to High (optional)

## Files

- CaseTrigger.trigger
- CaseTriggerHandler.cls
- CaseTriggerTest.cls

## Concepts Covered

- `before update` logic
- Use of `Trigger.oldMap`
- Avoiding overwrites
- Test class with multiple assertions
