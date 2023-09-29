import 'package:freezed_annotation/freezed_annotation.dart';
import "package:workout_model/src/i_identifiable.dart";
import "package:workout_model/src/exercise_model.dart";
import "package:workout_model/workout_model.dart";

part 'workout_model_base.freezed.dart';
part 'workout_model_base.g.dart';

enum WorkoutState {
  notStarted,
  running,
  paused,
  finished,
}

/// A workout consisting of a series of exercises.
@freezed
class Workout with _$Workout implements IIdentifiable {
  /// Private constructor with no parameters.
  /// Used by Freezed to enable use of methods in this class.
  const Workout._();

  /// Private constructor with a parameter for [uuid].
  /// Only used for code generation with Freezed.
  @JsonSerializable(explicitToJson: true)
  // ignore: unused_element
  factory Workout._def({
    required UUID uuid,
    required WorkoutState state,
    required DateTime? startTime,
    required DateTime? stopTime,
    required DateTime? resumedTime,
    required Duration workoutDuration,
    required List<Exercise> exercises,
  }) = _Workout;

  /// Constructs a new [Workout] object and sets [uuid] to a random v4 UUID.
  factory Workout({
    required List<Exercise> exercises,
  }) {
    return _Workout(
      uuid: IIdentifiable.generateUuid(),
      state: WorkoutState.notStarted,
      startTime: null,
      stopTime: null,
      resumedTime: null,
      workoutDuration: Duration.zero,
      exercises: exercises,
    );
  }

  /// Constructs a new [Workout] object from [baseWorkout],
  /// copying it's exercises, and sets [uuid] to a random v4 UUID.
  factory Workout.copy({
    required Workout baseWorkout,
  }) {
    return _Workout(
      uuid: IIdentifiable.generateUuid(),
      state: WorkoutState.notStarted,
      startTime: null,
      stopTime: null,
      resumedTime: null,
      workoutDuration: Duration.zero,
      exercises: baseWorkout.exercises,
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

  /// Removes an [Exercise] from [exercises] at [index].
  ///
  /// Throws [RangeError] if [index] is < 0 or >= [exercises.length]
  Workout removeExerciseAtIndex(int index) {
    List<Exercise> newExercises = <Exercise>[...exercises];
    newExercises.removeAt(index);
    return copyWith(exercises: newExercises);
  }

  Workout startWorkout() {
    if(state == WorkoutState.finished) return this;
    return copyWith(state: WorkoutState.running, startTime: DateTime.now());
  }

  Workout pauseWorkout() {
    if(_workoutHasNotStarted()) return this;
    if(state == WorkoutState.finished) return this;

    final DateTime currentTime = DateTime.now();
    Duration workoutDuration = this.workoutDuration;
    if(resumedTime == null) {
      workoutDuration += currentTime.difference(startTime!);
    } else {
      workoutDuration += currentTime.difference(resumedTime!);
    }
    return copyWith(state: WorkoutState.paused, workoutDuration: workoutDuration);
  }

  Workout resumeWorkout() {
    if(_workoutHasNotStarted()) return this;
    if(state == WorkoutState.finished) return this;

    final DateTime currentTime = DateTime.now();
    return copyWith(state: WorkoutState.running, resumedTime: currentTime);
  }

  Workout stopWorkout() {
    if(_workoutHasNotStarted()) return this;

    final DateTime currentTime = DateTime.now();
    Duration workoutDuration = this.workoutDuration;
    if(resumedTime == null) {
      workoutDuration += currentTime.difference(startTime!);
    } else {
      workoutDuration += currentTime.difference(resumedTime!);
    }
    return copyWith(state: WorkoutState.finished, stopTime: currentTime, workoutDuration: workoutDuration);
  }

  Workout resetWorkout() {
    return copyWith(state: WorkoutState.notStarted, startTime: null, stopTime: null, resumedTime: null, workoutDuration: Duration.zero);
  }

  bool _workoutHasNotStarted() {
    return startTime == null || state == WorkoutState.notStarted;
  }
}
