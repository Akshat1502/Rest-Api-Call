import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

    class HomePage extends StatefulWidget {
  const  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
 
}

class _HomePageState extends State<HomePage> {
   List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rest Api Calls'),
      ),
      body: ListView.builder(itemCount: users.length,itemBuilder: (context,index){
        final user = users[index];
        final email = user['email'];
        final fname = user['name']['first'];
        final imageUrl = user['picture']['medium'];
        
            return ListTile(
              
              leading: ClipOval(child: Image.network(imageUrl)),//Text('${index+1}'),
           title: Text(fname.toString()),   
          subtitle: Text(email),
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
    setState(() {
      users = json['results'];
    });
    print("fetching from Api completed!");
    
  }
}