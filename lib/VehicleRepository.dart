import 'Vehicle.dart';

class VehicleRepository {
  List<Vehicle> vehicles = [];

  void add(Vehicle vehicle) => vehicles.add(vehicle);
  List<Vehicle> getAll() => vehicles;
  Vehicle? getByRegistration(String registrationNumber) => vehicles.firstWhere((v) => v.registrationNumber == registrationNumber, orElse: () => null);
  void update(Vehicle updatedVehicle) {
    final index = vehicles.indexWhere((v) => v.registrationNumber == updatedVehicle.registrationNumber);
    if (index != -1) vehicles[index] = updatedVehicle;
  }
  void delete(String registrationNumber) => vehicles.removeWhere((v) => v.registrationNumber == registrationNumber);
}
