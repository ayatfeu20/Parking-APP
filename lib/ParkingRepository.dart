import 'Parking.dart';

class ParkingRepository {
  List<Parking> parkings = [];

  void add(Parking parking) => parkings.add(parking);
  List<Parking> getAll() => parkings;
  Parking? getByVehicleRegistration(String registrationNumber) => parkings.firstWhere((p) => p.vehicle.registrationNumber == registrationNumber, orElse: () => null);
  void update(Parking updatedParking) {
    final index = parkings.indexWhere((p) => p.vehicle.registrationNumber == updatedParking.vehicle.registrationNumber);
    if (index != -1) parkings[index] = updatedParking;
  }
  void delete(String registrationNumber) => parkings.removeWhere((p) => p.vehicle.registrationNumber == registrationNumber);
}
