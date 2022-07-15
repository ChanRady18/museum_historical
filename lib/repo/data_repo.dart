import 'package:museum_test_api/model/data_model.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Future<List<DataModel>> listDataRepo() async{
  var request = http.Request('GET', Uri.parse('http://192.168.99.117:8000/api/museum/index'));


  http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
    var data = (await response.stream.bytesToString());
    print(data);
    var jsonResponse =  convert.jsonDecode(data) ;
    List<DataModel> l = [];
    for (var x in jsonResponse) {
      l.add( DataModel.fromJson(x));
    }
    return l;
  }
  else {
    print(response.reasonPhrase);
  }

  return [];
}

List<BannerModel> getBannerRepo(){
  List<BannerModel> b = [];
  b.add(BannerModel(
    title: "Angkor Wat",
    subtitle: "Siem Reap",
    description: "Angkor Wat is a temple complex in Cambodia and is the largest religious monument in the world, on a site measuring 162.6 hectares. Breaking from Shaiva tradition of previous kings, Angkor Wat was dedicated to Vishnu for the Khmer Empire",
    image: "https://images.unsplash.com/photo-1549463601-da058868e20d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  ));
  b.add(BannerModel(
    title: "National Museum of Cambodia",
    subtitle: "Phnom Penh",
    description: "The National Museum of Cambodia is Cambodia's largest museum of cultural history and is the country's leading historical and archaeological museum. It is located in Chey Chumneas, Phnom Penh.",
    image: "https://lp-cms-production.imgix.net/2019-06/GettyImages-171575761_high.jpg",
  ));
  b.add(BannerModel(
    title: "The Metropolitan Museum of Art",
    subtitle: "New York, United States",
    description: "The Metropolitan Museum of Art of New York City, colloquially 'the Met', is the largest art museum in the Western Hemisphere. Its permanent collection contains over two million works, divided among 17 curatorial departments.",
    image: "https://media.timeout.com/images/105813641/image.jpg",
  ));
  
  return b;
}