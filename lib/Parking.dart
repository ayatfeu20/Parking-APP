import 'Vehicle.dart';
import 'ParkingSpace.dart';

class Parking {
  Vehicle vehicle;
  ParkingSpace parkingSpace;
  DateTime startTime;
  DateTime? endTime;

  Parking({required this.vehicle, required this.parkingSpace, required this.startTime, this.endTime});
}
