# Contact Trigger Handler – Apex Trigger Framework Implementation

This module demonstrates the use of the Apex Trigger Framework pattern applied to the `Contact` object using a clean Dispatcher + Handler architecture.

## 🔍 Use Case

- When a **Contact** is inserted, create a follow-up **Welcome Task**
- When a **Contact** is updated, log any changes to **Email** or **Phone** into a custom `Field_Change_Log__c` object
- When a **Contact** is deleted, remove all associated `Field_Change_Log__c` records

## 🧱 Architecture

- Implements the `ObjectTriggerHandler` interface
- Follows single-responsibility and open-closed principles
- Compatible with a generic `TriggerDispatcher` used across SObjects

## ⚙️ Trigger Events Handled

| Trigger Context | Method | Action |
|-----------------|--------|--------|
| `after insert`  | `afterInsert()` | Create Welcome Task |
| `after update`  | `afterUpdate()` | Log field changes (Email, Phone) |
| `before delete` | `beforeDelete()` | Delete related change logs |
| All others      | Implemented for interface completeness |

## 📁 Files Included

- `ContactTriggerHandler.cls` – contains all trigger logic for Contact
- `ContactTrigger.trigger` – routes logic via `TriggerDispatcher`
- `TriggerDispatcher.cls` – generic dispatcher that routes based on context
- `ObjectTriggerHandler.cls` – interface defining trigger method signatures

## ✅ Tags

`#ApexTriggerFramework` `#PD2` `#CTAReadiness` `#SalesforceArchitect` `#OOPDesign`

## 🧪 Test Coverage

Comes with full test class:
- Validates correct Task creation
- Verifies log entries on field change
- Confirms log cleanup on Contact delete
