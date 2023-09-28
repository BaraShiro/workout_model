/// An exercise consisting of a number of repetitions with a certain weight,
/// grouped into sets with rest time in between.
class Exercise {
  String id;
  String name;
  String description;
  int numberOfRepetitions;
  int restTimeInMinutes;
  int numberOfSets;
  double weightInKilograms;

  Exercise(this.id, this.name, this.description, this.numberOfRepetitions,
      this.restTimeInMinutes, this.numberOfSets, this.weightInKilograms);

}