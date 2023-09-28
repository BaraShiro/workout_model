// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseImpl _$$ExerciseImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      numberOfRepetitions: json['numberOfRepetitions'] as int,
      restTimeInMinutes: json['restTimeInMinutes'] as int,
      numberOfSets: json['numberOfSets'] as int,
      weightInKilograms: (json['weightInKilograms'] as num).toDouble(),
    );

Map<String, dynamic> _$$ExerciseImplToJson(_$ExerciseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'numberOfRepetitions': instance.numberOfRepetitions,
      'restTimeInMinutes': instance.restTimeInMinutes,
      'numberOfSets': instance.numberOfSets,
      'weightInKilograms': instance.weightInKilograms,
    };
