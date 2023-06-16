class User {
  final String email;
 final  String gender;
 final String phone;
 final String cell;
 final String nat;
 final UserName name;
  User({
    required this.email,
    required this.gender,
    required this.phone,
    required this.cell,
    required this.nat, 
    required this.name,
  });
}

class UserName {
  final String title;
  final String first;
  final String last;


  UserName({
    required this.title,
    required this.first,
    required this.last,
  });
}