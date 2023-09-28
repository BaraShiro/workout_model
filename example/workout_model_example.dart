import 'package:workout_model/workout_model.dart';

void main() {
  Exercise exercise = Exercise(
    name:"An exercise",
    description: "Some exercise that can be done",
    numberOfRepetitions: 4,
    restTimeInMinutes: 1,
    numberOfSets: 5,
    weightInKilograms: 20.0);

  Exercise exercise2 = exercise
      .updateName("An updated exercise")
      .updateNumberOfRepetitions(8);

  Exercise exercise3 = Exercise(
    name: "Some exercise",
    description: "An exercise that's fun to do",
    numberOfRepetitions: 7,
    restTimeInMinutes: 1,
    numberOfSets: 3,
    weightInKilograms: 2.5);

  Exercise exercise4 = Exercise.fromJson(exercise3.toJson());

  print(exercise.toJson());
  print(exercise2.toJson());
  print(exercise3.toJson());
  print(exercise4.toJson());
}
