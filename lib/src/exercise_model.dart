import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workout_model/src/IIdentifiable.dart';

part 'exercise_model.freezed.dart';
part 'exercise_model.g.dart';

/// An exercise consisting of a number of repetitions with a certain weight,
/// grouped into sets with rest time in between.
@freezed
class Exercise with _$Exercise implements IIdentifiable {
  factory Exercise.def({
    required UUID uuid,
    required String name,
    required String description,
    required int numberOfRepetitions,
    required int restTimeInMinutes,
    required int numberOfSets,
    required double weightInKilograms,
  }) = _Exercise;

  factory Exercise({
    required String name,
    required String description,
    required int numberOfRepetitions,
    required int restTimeInMinutes,
    required int numberOfSets,
    required double weightInKilograms,
  }) {
    return _Exercise(
      uuid: IIdentifiable.generateUuid(),
      name: name,
      description: description,
      numberOfRepetitions: numberOfRepetitions,
      restTimeInMinutes: restTimeInMinutes,
      numberOfSets: numberOfSets,
      weightInKilograms: weightInKilograms
    );
  }

  factory Exercise.fromJson(Map<String, Object?> json)
  => _$ExerciseFromJson(json);
}