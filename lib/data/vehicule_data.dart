import 'package:idirtrack/models/vihicule.dart';

List<Vehicle> getVehicles() {
  return List.generate(
    10,
    (index) => Vehicle(
      name: "MIDLUM 40255-A-20",
      date: "06/04/2024 00:06:52",
      location: "HXH6+MVP, Mirleft, Maroc",
      status: index % 2 == 0 ? "En marche" : "Parking",
      battery: "12.2V",
      delay: "8 jr(s)",
      repairStatus: "En Reparation",
      availability: "En retard",
      id: '1',
    ),
  );
}
