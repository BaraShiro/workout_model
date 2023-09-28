import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_model.freezed.dart';
part 'exercise_model.g.dart';

/// An exercise consisting of a number of repetitions with a certain weight,
/// grouped into sets with rest time in between.
@freezed
class Exercise with _$Exercise {
  const factory Exercise({
    required String id,
    required String name,
    required String description,
    required int numberOfRepetitions,
    required int restTimeInMinutes,
    required int numberOfSets,
    required double weightInKilograms,
  }) = _Exercise;

  factory Exercise.fromJson(Map<String, Object?> json)
  => _$ExerciseFromJson(json);

}