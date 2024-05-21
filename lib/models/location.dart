import 'package:idirtrack/models/vihicule.dart';

class Location {
  String username;
  String password;
  Location(this.username, this.password);

  void modificationDeMotDePass() {
    // Implement logic
  }
  List<Vehicle> getVehicles() {
    return [
      Vehicle(
        name: "MIDLUM 40255-A-20",
        date: "06/04/2024 00:06:52",
        location: "HXH6+MVP, Mirleft, Maroc",
        status: "En marche",
        battery: "12.2V",
        delay: "8 jr(s)",
        repairStatus: "En Reparation",
        availability: "En retard",
        id: '1',
      ),
      Vehicle(
        name: "HAMZA 40255-A-20",
        date: "06/04/2024 00:06:52",
        location: "HXH6+MVP, Mirleft, Maroc",
        status: "En marche",
        battery: "12.2V",
        delay: "8 jr(s)",
        repairStatus: "En Reparation",
        availability: "En retard",
        id: '1',
      ),
    ];
  }
}
