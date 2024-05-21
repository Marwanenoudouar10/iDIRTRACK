import 'package:idirtrack/models/vihicule.dart';

class Notification {
  Vehicle vehicle;
  bool demarrage;
  int vitesse;
  bool batterieFaible;
  bool capot;
  int temperatureFrigoMin;
  int temperatureFrigoMax;
  bool vidange;
  bool assuranceExiste;
  bool visiteTechnique;

  Notification({
    required this.vehicle,
    required this.demarrage,
    required this.vitesse,
    required this.batterieFaible,
    required this.capot,
    required this.temperatureFrigoMin,
    required this.temperatureFrigoMax,
    required this.vidange,
    required this.assuranceExiste,
    required this.visiteTechnique,
  });
}
