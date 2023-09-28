import 'package:workout_model/workout_model.dart';

void main() {
  Exercise exercise = Exercise(
      id:"asdfasdf",
      name:"An exercise",
      description: "Some exercise that can be done",
      numberOfRepetitions: 4,
      restTimeInMinutes: 1,
      numberOfSets: 5,
      weightInKilograms: 20.0);

  Exercise exercise2 = exercise.copyWith(name: "Another exercise", numberOfRepetitions: 8);

  print(exercise.toJson());
  print(exercise2.toJson());
}
