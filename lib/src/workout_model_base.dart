import 'package:freezed_annotation/freezed_annotation.dart';
import "package:workout_model/src/i_identifiable.dart";
import "package:workout_model/src/exercise_model.dart";

part 'workout_model_base.freezed.dart';
part 'workout_model_base.g.dart';

/// A workout consisting of a series of exercises.
@freezed
class Workout with _$Workout implements IIdentifiable {
  /// Private constructor with no parameters.
  /// Used by Freezed to enable use of methods in this class.
  const Workout._();

  /// Private constructor with a parameter for [uuid].
  /// Only used for code generation with Freezed.
  @JsonSerializable(explicitToJson: true)
  factory Workout._def({
    required UUID uuid,
    required List<Exercise> exercises,
  }) = _Workout;

  /// Constructs a new [Workout] object and sets [uuid] to a random v4 UUID.
  factory Workout({
    required List<Exercise> exercises,
  }) {
    return _Workout(
      uuid: IIdentifiable.generateUuid(),
      exercises: exercises,
    );
  }

  /// Constructs a new [Workout] object from a Json object.
  factory Workout.fromJson(Map<String, Object?> json)
  => _$WorkoutFromJson(json);

  /// Adds an [Exercise] to this [Workout].
  Workout updateExercises(Exercise newExercise) {
    return copyWith(exercises: <Exercise>[...exercises, newExercise]);
  }

  /// Adds several [Exercise]s in a [List] to this [Workout].
  Workout updateExercisesWithSeveral(List<Exercise> newExercises) {
    return copyWith(exercises: <Exercise>[...exercises, ...newExercises]);
  }
}
