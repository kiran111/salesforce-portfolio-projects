# Prevent Account Deletion with Open Cases (Before Delete Trigger)

## Objective

Prevent users from deleting an Account if it has any open (non-Closed) Cases.

## Trigger Type

- `before delete`

## Logic Summary

- Loop through Trigger.old to gather Account IDs
- Query Cases with Status ≠ 'Closed'
- Use `addError()` to block the delete operation if open cases exist

## Concepts Covered

- `before delete` usage
- Validation using related records
- Bulk-safe pattern with SOQL + Set
- `addError()` messaging
- Apex test class with positive + negative tests

## How to Test

- Create Account + Case with Status = "New"
- Try to delete → should fail
- Create Account with no Cases → should delete successfully
