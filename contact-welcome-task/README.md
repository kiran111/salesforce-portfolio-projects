# Contact Welcome Task (After Insert Trigger)

## Objective

Automatically creates a Task for new Contacts to schedule a welcome call 7 days after creation.

## Trigger Type
- `after insert`

## Logic Summary

- Trigger calls a handler after insert
- Handler creates a new Task with:
  - Subject: “Welcome Call”
  - ActivityDate: Today + 7 days
  - WhatId = Contact.Id

## Concepts Covered

- `after insert` logic
- DML on related records
- Task creation and assignment
- Apex test class with query validation

## How to Test

1. Insert a Contact
2. Query Task with `WhatId = Contact.Id`
3. Assert one Welcome Task is created
