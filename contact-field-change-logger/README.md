# Contact Field Change Logger (After Update Trigger)

## Objective

Track field changes on Contact (e.g., Email, Phone) and create a log entry in a custom object `Field_Change_Log__c`.

## Trigger Type

- `after update`

## Logic Details

- Uses `Trigger.oldMap` to compare Email and Phone
- Inserts log entries for changed fields
- Each log record includes Contact reference, field name, old/new values, and timestamp

## Files

- ContactTrigger.trigger
- ContactTriggerHandler.cls
- ContactTriggerTest.cls

## Custom Object Fields

- Contact__c (Lookup to Contact)
- Field_Name__c (Text)
- Old_Value__c (Text)
- New_Value__c (Text)
- Changed_On__c (DateTime)

## Test Instructions

- Insert a Contact
- Update Email or Phone
- Assert two new Field Change Log records created

## Concepts Covered

- After Update Trigger
- Change detection with oldMap
- DML on related records
