import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workout_model/src/IIdentifiable.dart';

part 'exercise_model.freezed.dart';
part 'exercise_model.g.dart';

/// An exercise consisting of a number of repetitions with a certain weight,
/// grouped into sets with rest time in between.
@freezed
class Exercise with _$Exercise implements IIdentifiable {
  /// Private constructor with no parameters.
  /// Used by Freezed to enable use of methods in this class.
  const Exercise._();

  /// Private constructor with a parameter for [uuid].
  /// Only used for code generation with Freezed.
  factory Exercise._def({
    required UUID uuid,
    required String name,
    required String description,
    required int numberOfRepetitions,
    required int restTimeInMinutes,
    required int numberOfSets,
    required double weightInKilograms,
  }) = _Exercise;

  /// Constructs a new [Exercise] object and sets [uuid] to a random v4 UUID.
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

  /// Constructs a new [Exercise] object from a Json object.
  factory Exercise.fromJson(Map<String, Object?> json)
  => _$ExerciseFromJson(json);

  /// Updates the [name] of this [Exercise]
  Exercise updateName(String newName)
  {
    return copyWith(name: newName);
  }

  /// Updates the [description] of this [Exercise]
  Exercise updateDescription(String newDescription)
  {
    return copyWith(description: newDescription);
  }

  /// Updates the [numberOfRepetitions] of this [Exercise]
  Exercise updateNumberOfRepetitions(int newNumberOfRepetitions)
  {
    return copyWith(numberOfRepetitions: newNumberOfRepetitions);
  }

  /// Updates the [restTimeInMinutes] of this [Exercise]
  Exercise updateRestTimeInMinutes(int newRestTimeInMinutes)
  {
    return copyWith(restTimeInMinutes: newRestTimeInMinutes);
  }

  /// Updates the [numberOfSets] of this [Exercise]
  Exercise updateNumberOfSets(int newNumberOfSets)
  {
    return copyWith(numberOfSets: newNumberOfSets);
  }

  /// Updates the [weightInKilograms] of this [Exercise]
  Exercise updateWeightInKilograms(double newWeightInKilograms)
  {
    return copyWith(weightInKilograms: newWeightInKilograms);
  }
}