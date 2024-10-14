import 'ParkingSpace.dart';

class ParkingSpaceRepository {
  List<ParkingSpace> spaces = [];

  void add(ParkingSpace space) => spaces.add(space);
  List<ParkingSpace> getAll() => spaces;
  ParkingSpace? getById(int id) => spaces.firstWhere((s) => s.id == id, orElse: () => null);
  void update(ParkingSpace updatedSpace) {
    final index = spaces.indexWhere((s) => s.id == updatedSpace.id);
    if (index != -1) spaces[index] = updatedSpace;
  }
  void delete(int id) => spaces.removeWhere((s) => s.id == id);
}
