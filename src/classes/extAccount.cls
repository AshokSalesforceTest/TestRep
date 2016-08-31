public class extAccount{

public extAccount(){}

public List<selectOption> getAccts(){

//acclist=[select name from Account];

List<selectOption> acclist=new List<selectOption>();

acclist.add(new selectOption('','--Select--'));

for(Account a : [select id,name from Account])
{
acclist.add(new selectOption(a.id,a.name));

}
return acclist;

}


}