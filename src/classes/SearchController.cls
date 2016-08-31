public with sharing class SearchController {

public string searchText{get;set;}

public string Name{get;set;} 

public string Level{get;set;} 

public string SubLevel{get;set;} 

public Map<string,PickListTest__c> AllValuesMap{get;set;}

public List<PickListTest__c> results{get;set;}

public SearchController(){

AllValuesMap = PickListTest__c.getAll();

}
public List<PickListTest__c> resultSearch(){


searchText=Apexpages.currentPage().getParameters().get('passKeyword');

system.debug('ASHOK'+searchText);

system.debug('ASHOK'+AllValuesMap.get('Ashok'));

//results.add(AllValuesMap.get('Ashok'));

results = new List<PickListTest__c>(AllValuesMap.values());

for(PickListTest__c v:results){

Name=v.Name;
Level=v.Level1__c;
SubLevel=v.Level2__c;

}
return results;
}
public pagereference getresults(){
resultSearch();

return null;

}
}