trigger UpdateTicketPriority on Ticket__c (before update) {

    list<Ticket__c> ticketList=new list<Ticket__c>();
    for(Ticket__c t:[select UrgencyLookup__c,ImpactLookup__c from Ticket__c where id in:Trigger.New]){
        
        if(t.UrgencyLookup__c=='High' && t.ImpactLookup__c=='High'){
            
            t.PriorityValue__c='1';
            ticketList.add(t);
        }
        else if(t.UrgencyLookup__c=='High' && t.ImpactLookup__c=='Low'){
            
            t.PriorityValue__c='2';
            ticketList.add(t);
        }
        else if(t.UrgencyLookup__c=='Low' && t.ImpactLookup__c=='High'){
            
            t.PriorityValue__c='3';
            ticketList.add(t);
        }
        else{
            t.PriorityValue__c='4';
            ticketList.add(t);
        }
    }
    update ticketList;
}