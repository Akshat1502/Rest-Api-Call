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
  User({
    required this.dob,
    required this.email,
    required this.gender,
    required this.phone,
    required this.cell,
    required this.nat, 
    required this.name,
    required this.location,
  });
  String get fullName{
    return '${name.title} ${name.first} ${name.last}';

  }
}

