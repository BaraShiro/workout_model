import 'package:workout_model/workout_model.dart';

void main() {
  Exercise exercise = Exercise("asdfasdf", "An exercise", "Some exercise that can be done", 4, 1, 5, 20.0);
  print("Id: ${exercise.id}, Name: ${exercise.name}, Description: ${exercise.description}, Repetitions: ${exercise.numberOfRepetitions}, Rest Time: ${exercise.restTimeInMinutes}, Sets: ${exercise.numberOfSets}, Weight: ${exercise.weightInKilograms}");
}
