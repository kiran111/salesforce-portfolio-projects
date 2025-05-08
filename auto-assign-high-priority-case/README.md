# Auto Assign High-Priority Case (Flow)

Automatically assigns a new Case to a Queue when its Priority is "High".

## How It Works

- A **Record-Triggered Flow** on Case object checks if Priority = "High"
- If true, it fetches the **High Priority Queue** (Group object)
- Assigns the Case's **OwnerId** to that Queue

## Flow Elements

- Get Records (Queue)
- Update Records (OwnerId)
- Decision (if used, optional)

## Deployment Path

- flow-meta.xml file: `/force-app/main/default/flows/Auto_Assign_High_Priority_Cases.flow-meta.xml`

## Test Instructions

- Create a Case with Priority = High
- Case should be auto-assigned to the Queue


