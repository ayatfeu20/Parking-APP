// bin/main.dart
import 'dart:io';
import '../lib/Person.dart';
import '../lib/Vehicle.dart';
import '../lib/ParkingSpace.dart';
import '../lib/Parking.dart';
import '../lib/PersonRepository.dart';
import '../lib/VehicleRepository.dart';
import '../lib/ParkingSpaceRepository.dart';
import '../lib/ParkingRepository.dart';

void main() {
  final personRepo = PersonRepository();
  final vehicleRepo = VehicleRepository();
  final parkingSpaceRepo = ParkingSpaceRepository();
  final parkingRepo = ParkingRepository();

  while (true) {
    print('\nWelcome to the Parking App!');
    print('1. Manage People');
    print('2. Manage Vehicles');
    print('3. Manage Parking Spaces');
    print('4. Manage Parkings');
    print('5. Exit');
    stdout.write('Choose an option (1-5): ');
    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        handlePersonMenu(personRepo);
        break;
      case '2':
        handleVehicleMenu(vehicleRepo, personRepo);
        break;
      case '3':
        handleParkingSpaceMenu(parkingSpaceRepo);
        break;
      case '4':
        handleParkingMenu(parkingRepo, vehicleRepo, parkingSpaceRepo);
        break;
      case '5':
        print('Exiting...');
        exit(0);
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

void handlePersonMenu(PersonRepository repo) {
  print('\nYou have selected to manage People.');
  print('1. Add a new Person');
  print('2. View all People');
  print('3. Update a Person');
  print('4. Delete a Person');
  stdout.write('Choose an option (1-4): ');
  final choice = stdin.readLineSync();

  switch (choice) {
    case '1':
      stdout.write('Enter name: ');
      final name = stdin.readLineSync()!;
      stdout.write('Enter ID number: ');
      final idNumber = stdin.readLineSync()!;
      repo.add(Person(name: name, idNumber: idNumber));
      print('Person added successfully.');
      break;
    case '2':
      print('\nPeople List:');
      for (var person in repo.getAll()) {
        print('Name: ${person.name}, ID: ${person.idNumber}');
      }
      break;
    case '3':
      stdout.write('Enter ID number of the person to update: ');
      final idNumber = stdin.readLineSync()!;
      final person = repo.getById(idNumber);
      if (person != null) {
        stdout.write('Enter new name: ');
        final newName = stdin.readLineSync()!;
        person.name = newName;
        repo.update(person);
        print('Person updated successfully.');
      } else {
        print('Person not found.');
      }
      break;
    case '4':
      stdout.write('Enter ID number of the person to delete: ');
      final idNumber = stdin.readLineSync()!;
      repo.delete(idNumber);
      print('Person deleted successfully.');
      break;
    default:
      print('Invalid choice.');
  }
}

void handleVehicleMenu(VehicleRepository vehicleRepo, PersonRepository personRepo) {
  print('\nYou have selected to manage Vehicles.');
  print('1. Add a new Vehicle');
  print('2. View all Vehicles');
  print('3. Update a Vehicle');
  print('4. Delete a Vehicle');
  stdout.write('Choose an option (1-4): ');
  final choice = stdin.readLineSync();

  switch (choice) {
    case '1':
      stdout.write('Enter registration number: ');
      final regNumber = stdin.readLineSync()!;
      stdout.write('Enter type (e.g., car, motorcycle): ');
      final type = stdin.readLineSync()!;
      stdout.write('Enter owner ID number: ');
      final ownerId = stdin.readLineSync()!;
      final owner = personRepo.getById(ownerId);
      if (owner != null) {
        vehicleRepo.add(Vehicle(registrationNumber: regNumber, type: type, owner: owner));
        print('Vehicle added successfully.');
      } else {
        print('Owner not found.');
      }
      break;
    case '2':
      print('\nVehicle List:');
      for (var vehicle in vehicleRepo.getAll()) {
        print('Registration: ${vehicle.registrationNumber}, Type: ${vehicle.type}, Owner: ${vehicle.owner.name}');
      }
      break;
    case '3':
      stdout.write('Enter registration number of the vehicle to update: ');
      final regNumber = stdin.readLineSync()!;
      final vehicle = vehicleRepo.getByRegistration(regNumber);
      if (vehicle != null) {
        stdout.write('Enter new type: ');
        final newType = stdin.readLineSync()!;
        vehicle.type = newType;
        vehicleRepo.update(vehicle);
        print('Vehicle updated successfully.');
      } else {
        print('Vehicle not found.');
      }
      break;
    case '4':
      stdout.write('Enter registration number of the vehicle to delete: ');
      final regNumber = stdin.readLineSync()!;
      vehicleRepo.delete(regNumber);
      print('Vehicle deleted successfully.');
      break;
    default:
      print('Invalid choice.');
  }
}

void handleParkingSpaceMenu(ParkingSpaceRepository repo) {
  print('\nYou have selected to manage Parking Spaces.');
  print('1. Add a new Parking Space');
  print('2. View all Parking Spaces');
  print('3. Update a Parking Space');
  print('4. Delete a Parking Space');
  stdout.write('Choose an option (1-4): ');
  final choice = stdin.readLineSync();

  switch (choice) {
    case '1':
      stdout.write('Enter Parking Space ID: ');
      final id = int.parse(stdin.readLineSync()!);
      stdout.write('Enter address: ');
      final address = stdin.readLineSync()!;
      stdout.write('Enter price per hour: ');
      final price = double.parse(stdin.readLineSync()!);
      repo.add(ParkingSpace(id: id, address: address, pricePerHour: price));
      print('Parking Space added successfully.');
      break;
    case '2':
      print('\nParking Space List:');
      for (var space in repo.getAll()) {
        print('ID: ${space.id}, Address: ${space.address}, Price per hour: ${space.pricePerHour}');
      }
      break;
    case '3':
      stdout.write('Enter ID of the Parking Space to update: ');
      final id = int.parse(stdin.readLineSync()!);
      final space = repo.getById(id);
      if (space != null) {
        stdout.write('Enter new address: ');
        space.address = stdin.readLineSync()!;
        repo.update(space);
        print('Parking Space updated successfully.');
      } else {
        print('Parking Space not found.');
      }
      break;
    case '4':
      stdout.write('Enter ID of the Parking Space to delete: ');
      final id = int.parse(stdin.readLineSync()!);
      repo.delete(id);
      print('Parking Space deleted successfully.');
      break;
    default:
      print('Invalid choice.');
  }
}

void handleParkingMenu(ParkingRepository parkingRepo, VehicleRepository vehicleRepo, ParkingSpaceRepository spaceRepo) {
  print('\nYou have selected to manage Parkings.');
  print('1. Add a new Parking');
  print('2. View all Parkings');
  print('3. Update a Parking');
  print('4. Delete a Parking');
  stdout.write('Choose an option (1-4): ');
  final choice = stdin.readLineSync();

  switch (choice) {
    case '1':
      stdout.write('Enter vehicle registration number: ');
      final regNumber = stdin.readLineSync()!;
      final vehicle = vehicleRepo.getByRegistration(regNumber);
      if (vehicle == null) {
        print('Vehicle not found.');
        break;
      }

      stdout.write('Enter Parking Space ID: ');
      final spaceId = int.parse(stdin.readLineSync()!);
      final space = spaceRepo.getById(spaceId);
      if (space == null) {
        print('Parking Space not found.');
        break;
      }

      final startTime = DateTime.now();
      parkingRepo.add(Parking(vehicle: vehicle, parkingSpace: space, startTime: startTime));
      print('Parking added successfully.');
      break;

    case '2':
      print('\nParking List:');
      for (var parking in parkingRepo.getAll()) {
        print('Vehicle: ${parking.vehicle.registrationNumber}, Space: ${parking.parkingSpace.id}, Start Time: ${parking.startTime}');
      }
      break;

    case '3':
      print('Updating parkings is not yet implemented.');
      break;

    case '4':
      stdout.write('Enter vehicle registration number of the Parking to delete: ');
      final regNumber = stdin.readLineSync()!;
      parkingRepo.delete(regNumber);
      print('Parking deleted successfully.');
      break;

    default:
      print('Invalid choice.');
  }
}
