

import 'package:http/http.dart' as http;

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
      return User.fromMap(e);

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