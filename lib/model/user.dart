

import 'package:rest_api_calls/model/pictures.dart';
import 'package:rest_api_calls/model/user_dob.dart';
import 'package:rest_api_calls/model/user_location.dart';
import 'package:rest_api_calls/model/user_name.dart';

class User {
  final String email;
 final  String gender;
 final String phone;
 final String cell;
 final String nat;
 final UserName name;
 final UserDob dob;
 final UserLocation location;
 final UserPicture picture;
  User({
    required this.dob,
    required this.email,
    required this.gender,
    required this.phone,
    required this.cell,
    required this.nat, 
    required this.name,
    required this.location,
    required this.picture,
  });

 factory User.fromMap(Map<String,dynamic> e){
  
    
           final picture = UserPicture.fromMap(e['picture']);

      final location = UserLocation.fromMap(e['location']);

      //  final date =e['dob']['date'];//no need of it now because factory constructor is added in user_dob.//
      final dob = UserDob.fromMap(e['dob']);
      
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
      picture: picture,
    );
 }

  String get fullName{
    return '${name.title} ${name.first} ${name.last}';

  }
}

