import 'Person.dart';

class PersonRepository {
  List<Person> people = [];

  void add(Person person) => people.add(person);
  List<Person> getAll() => people;
  // lib/PersonRepository.dart
Person? getById(String idNumber) => people.firstWhere((p) => p.idNumber == idNumber, orElse: () => null);
  void update(Person updatedPerson) {
    final index = people.indexWhere((p) => p.idNumber == updatedPerson.idNumber);
    if (index != -1) people[index] = updatedPerson;
  }
  void delete(String idNumber) => people.removeWhere((p) => p.idNumber == idNumber);
}
