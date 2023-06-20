

import 'package:http/http.dart' as http;
import 'package:rest_api_calls/model/user_dob.dart';
import 'package:rest_api_calls/model/user_location.dart';
import '../model/user_name.dart';
import 'dart:convert';
 import '../model/user.dart';



class UserApi{
 static Future <List<User>> fetchUsers() async {
    // print("Api is fetching data");
    const url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);
    final Response = await http.get(uri);
    final body = Response.body;
    final json = jsonDecode(body);
    final results = json ['results'] as List<dynamic>;
    final users = results.map((e) {

      final coordinates = LocationCoordinate(
        latitude: e['location']['coordinates']['latitude'],

         longitude: e['location']['coordinates']['longitude']);

         final street = LocationStreet(
          number: e['location']['street']['number'],
           name: e['location']['street']['name']);

           final timezone = LocationTimezoneCoordinate(
            description: e['location']['timezone']['description'],
             offset: e['location']['timezone']['offset']);

      final location = UserLocation(city: e['location']['city'],
       state: e['location']['state'],
        country: e['location']['country'], 
        postcode: e['location']['postcode'].toString(),  //since postcodes are in int we changing it to type string//
         street: street,
          coordinates: coordinates,
           timezone: timezone);

      final date =e['dob']['date'];
      final dob = UserDob(
        age:e['dob']['age'] , 
        date: DateTime.parse(date)
        ,);
      
       final  name = UserName(

       title: e['name']['title'], 
       first: e['name']['first'], 
       last: e['name']['last'],
       );

      return User(
      cell: e['cell'],
      email: e['email'],
      gender: e['gender'],
      nat: e['nat'],
      phone: e['phone'],
      name: name,
      dob: dob,
      location: location,
    );
    }).toList();

    // setState(() {
    //   users = users;
    // }
    // );


    // setState(() {
      // users = json['results'];   // commit -1
    // });
    return users;
    // print("fetching from Api completed!");
    
  }

}