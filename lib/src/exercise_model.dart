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

  factory Exercise.fromJson(Map<String, Object?> json)
  => _$ExerciseFromJson(json);

  Exercise updateName(String newName)
  {
    return copyWith(name: newName);
  }

  Exercise updateDescription(String newDescription)
  {
    return copyWith(description: newDescription);
  }

  Exercise updateNumberOfRepetitions(int newNumberOfRepetitions)
  {
    return copyWith(numberOfRepetitions: newNumberOfRepetitions);
  }

  Exercise updateRestTimeInMinutes(int newRestTimeInMinutes)
  {
    return copyWith(restTimeInMinutes: newRestTimeInMinutes);
  }

  Exercise updateNumberOfSets(int newNumberOfSets)
  {
    return copyWith(numberOfSets: newNumberOfSets);
  }

  Exercise updateWeightInKilograms(double newWeightInKilograms)
  {
    return copyWith(weightInKilograms: newWeightInKilograms);
  }
}