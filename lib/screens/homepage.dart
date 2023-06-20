import 'package:flutter/material.dart';
 import '../model/user.dart';
import '../services/user_api.dart';


    class HomePage extends StatefulWidget {
  const  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
 
}

class _HomePageState extends State<HomePage> {
   List<User> users = [];

  @override
  void initState(){
 super.initState();
 fetchUsers();

  }

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
              leading: Image.network(user.picture.thumbnail),
             
              title: Text(user.fullName),
              subtitle: Row(
                children: [
                  Text(user.location.country),
                  const SizedBox(width: 10,),
                  Text(user.dob.date.toString()),
                ],
              ),
              // tileColor: color,

        );
      }),
    );

  }
  Future <void> fetchUsers() async{
final response = await UserApi.fetchUsers();
setState(() {
  users=response;
});
        

}
 
}

