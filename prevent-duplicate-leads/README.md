# Prevent Duplicate Leads on Insert

## Objective

This project contains a `before insert` trigger to prevent inserting duplicate Leads with the same email address.

## Use Case

If a new Lead is being inserted and its email matches an existing Lead (case-insensitive), the insert is blocked with an `addError()` message.

## Files

- `LeadTrigger.trigger`
- `LeadTriggerHandler.cls`
- `LeadTriggerTest.cls`

## Concepts Covered

- Trigger type: `before insert`
- Use of `addError()` to prevent insert
- Bulk-safe logic using `Set` and `Map`
- Handler class separation
- Apex test class with exception validation

## Test Instructions

1. Insert a Lead with `email = test@example.com`
2. Try inserting another Lead with same email → should fail
3. Insert a Lead with a different email → should pass
