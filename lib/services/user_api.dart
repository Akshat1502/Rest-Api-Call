import 'package:http/http.dart' as http;
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
      
       final  name = UserName(

       title: e['name']['title'], 
       first: e['name']['first'], 
       last: e['name']['last']
       );

      return User(
      cell: e['cell'],
      email: e['email'],
      gender: e['gender'],
      nat: e['nat'],
      phone: e['phone'],
      name: name,
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