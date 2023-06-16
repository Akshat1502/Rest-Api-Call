import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

 import '../model/user.dart';

    class HomePage extends StatefulWidget {
  const  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
 
}

class _HomePageState extends State<HomePage> {
   List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rest Api Calls'),
      ),
      body: ListView.builder(itemCount: users.length,itemBuilder: (context,index){
        final user = users[index];
        final email = user.email;
        final phone = user.phone;
        final cell = user.cell;
        
      // final color = user.gender== 'male' ? Colors.blue :Colors.green;
        // final email = user['email'];
        // final fname = user['name']['first'];
        // final imageUrl = user['picture']['medium'];
        
            return ListTile(
              title: Text(user.name.first),
              subtitle: Text(phone),
              // tileColor: color,

        );
      }),
      floatingActionButton:  FloatingActionButton(onPressed: fetchUsers),
      
    );

  }
  void fetchUsers() async {
    print("Api is fetching data");
    const url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);
    final Response = await http.get(uri);
    final body = Response.body;
    final json = jsonDecode(body);
    final results = json ['results'] as List<dynamic>;
    final transformed = results.map((e) {
      
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

    setState(() {
      users = transformed;
    });


    // setState(() {
      // users = json['results'];   // commit -1
    // });
    print("fetching from Api completed!");
    
  }
}