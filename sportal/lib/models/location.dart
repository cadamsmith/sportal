class Location {
  int locationID;
  double latitude;
  double longitude;
  String formattedAddress;

  Location(
      {required this.locationID,
        required this.latitude,
        required this.longitude,
        required this.formattedAddress});
}
