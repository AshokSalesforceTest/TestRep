public class ParkLocator{

//public List<string> countryList = new List<string>{'Germany','India','Japan','United States'};

public static string[] country(string con){

ParkService.ParksImplPort pp = new ParkService.ParksImplPort();

return pp.byCountry(con);

}

}