public class AnimalLocator{

public static string getAnimalNameById(Integer id) {
// This is my second commit.
Http http = new Http();
HttpRequest hreq = new HttpRequest();
hreq.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
hreq.setMethod('GET');
HttpResponse res = http.send(hreq);
Map<String,Object> animals = new Map<String,Object>();
// This is my third commit.
if (res.getStatusCode() == 200) {
Map<String,Object> results = (Map<String,Object>)JSON.deserializeUntyped(res.getBody());
animals = (Map<String,Object>)results.get('animal');
}
//checking the pull
else{System.debug('The status code returned was not expected: ' + res.getStatusCode() + ' ' + res.getStatus());}
// This is my fourth commit.
return (string)animals.get('name');
}
}
