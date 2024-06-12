class Vehicle {
  int id;
  String make;
  String model;
  String name;
  String date;
  String location;
  String status;
  String battery;
  String delay;
  String repairStatus;
  String availability;

  Vehicle(
      {required this.id,
      required this.make,
      required this.model,
      required this.name,
      required this.date,
      required this.location,
      required this.status,
      required this.battery,
      required this.delay,
      required this.repairStatus,
      required this.availability});

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'],
      make: json['make'],
      model: json['model'],
      name: json['name'],
      date: json['date'],
      location: json['location'],
      status: json['status'],
      battery: json['battery'],
      delay: json['delay'],
      repairStatus: json['repairStatus'],
      availability: json['availability'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'make': make,
      'model': model,
      'name': name,
      'date': date,
      'location': location,
      'status': status,
      'battery': battery,
      'delay': delay,
      'repairStatus': repairStatus,
      'availability': availability,
    };
  }
}
