public with sharing class LeadTriggerHandler {
    public static void autoConvertLeads(List<Lead> leads) {
        List<Database.LeadConvert> leadConverts = new List<Database.LeadConvert>();

        for (Lead l : leads) {
            // Safety check
            if (l.Auto_Convert__c && !l.IsConverted && l.Company != null && l.LastName != null) {
                Database.LeadConvert lc = new Database.LeadConvert();
                lc.setLeadId(l.Id);
                lc.setDoNotCreateOpportunity(true);
                lc.setConvertedStatus('Closed - Converted'); // Make sure this matches a valid Lead Status
                leadConverts.add(lc);
            }
        }

        if (!leadConverts.isEmpty()) {
            try {
                List<Database.LeadConvertResult> results = Database.convertLead(leadConverts, false);
                for (Database.LeadConvertResult res : results) {
                    if (!res.isSuccess()) {
                        System.debug('Lead Conversion Failed: ' + res.getErrors());
                    }
                }
            } catch (Exception e) {
                System.debug('Exception during lead conversion: ' + e.getMessage());
            }
        }
    }
}