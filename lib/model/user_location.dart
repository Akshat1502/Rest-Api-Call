class UserLocation{
final String city;
final  String state;
final String country;
final String postcode;
final LocationStreet street;
final LocationCoordinate coordinates;
final LocationTimezoneCoordinate timezone;
UserLocation({
  required this.city,
  required this.state,
  required this.country,
  required this.postcode,
  required this.street,
  required this.coordinates,
  required this.timezone,
});
factory UserLocation.fromMap(Map <String, dynamic> json){
   final coordinates = LocationCoordinate.fromMap(json['coordinates']);

         final street = LocationStreet.fromMap(json['street']);

           final timezone = LocationTimezoneCoordinate.fromMap(json['timezone']);

  return UserLocation(city: json['city'],
       state: json['state'],
        country: json['country'], 
        postcode: json['postcode'].toString(),  //since postcodes are in int we changing it to type string//
         street: street,
          coordinates:coordinates,
           timezone: timezone,);
}


}

class LocationStreet {
  final int number;
  final String name;
  LocationStreet({
    required this.number,
    required this.name,
  });
 
 factory LocationStreet.fromMap(Map < String,dynamic> json){

  return LocationStreet(
          number: json['number'],
           name: json['name']);
 }
}

class LocationTimezoneCoordinate {
  final String offset;
  final String description;
  LocationTimezoneCoordinate({
    required this.description,
    required this.offset,
  });
  factory LocationTimezoneCoordinate.fromMap(Map <String,dynamic> json){
   return LocationTimezoneCoordinate(
            description: json['description'],
             offset: json['offset']);
  }
 
}

class LocationCoordinate {
   final String latitude;
  final String longitude;
  LocationCoordinate({
     required this.latitude,
     required  this.longitude,
  });
 factory LocationCoordinate.fromMap(Map<String,dynamic> json){
  return LocationCoordinate(
        latitude: json['latitude'],

         longitude: json['longitude']);
 }

}